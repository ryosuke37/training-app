import 'package:app/src/component/repetition_timer/time_data.dart';
import 'package:app/src/component/repetition_timer/timer_bloc/timer_bloc.dart';
import 'package:common_component/common_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSetter extends StatelessWidget {
  const TimeSetter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListSection(children: [_RepeatNumSetter()]),
        ListSection(
          dividerMargin: 0,
          children: [
            _TimeSetterTile.ready(),
            _TimeSetterTile.work(),
          ],
        ),
      ],
    );
  }
}

class _RepeatNumSetter extends StatelessWidget {
  const _RepeatNumSetter();

  void _showDialog(BuildContext context, Widget child) {
    // bottomNavigationでNavigatorが分かれているため
    // useRootNavigator: false としないと、正常な動作にならない
    showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => Center(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) {
        return previous.currentRoutine.repeatNum !=
            current.currentRoutine.repeatNum;
      },
      builder: (context, state) {
        return ListTile(
          leading: const Icon(Icons.repeat),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text(state.currentRoutine.repeatNum.toString())],
          ),
          onTap: () => _showDialog(
            context,
            NumberPickDialog(
              initialNumber: state.currentRoutine.repeatNum,
              unit: const Text('times'),
              onOkTapped: (newRepeatNum) {
                context.read<TimerBloc>().add(
                      RepeatNumSet(
                        routineIndex: state.currentRoutineIndex,
                        repeatNum: newRepeatNum,
                      ),
                    );
                Navigator.pop(context);
              },
              onCancelTapped: (_) {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
}

class _TimeSetterTile extends StatelessWidget {
  const _TimeSetterTile.work() : isWork = true;
  const _TimeSetterTile.ready() : isWork = false;

  final bool isWork;

  void _showDialog(BuildContext context, Widget child) {
    // bottomNavigationでNavigatorが分かれているため
    // useRootNavigator: false としないと、正常な動作にならない
    showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => Center(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) {
        return previous.currentAction != current.currentAction;
      },
      builder: (context, state) {
        final duration = isWork
            ? state.currentAction.workDuration
            : state.currentAction.readyDuration;
        final iconData = isWork
            ? Icons.local_fire_department_rounded
            : Icons.favorite_rounded;

        return ListTile(
          leading: Icon(iconData),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text(duration.toDisplayString)],
          ),
          onTap: () => _showDialog(
            context,
            TimePickDialog(
              initialDuration: duration,
              onOkTapped: (newDuration) {
                context.read<TimerBloc>().add(
                      ActionUpdated(
                        routineIndex: state.currentRoutineIndex,
                        actionIndex: state.currentActionIndex,
                        action: state.currentAction.copyWith(
                          readyDuration: isWork ? null : newDuration,
                          workDuration: isWork ? newDuration : null,
                        ),
                      ),
                    );
                Navigator.pop(context);
              },
              onCancelTapped: (_) {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
}
