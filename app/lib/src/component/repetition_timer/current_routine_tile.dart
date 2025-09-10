import 'package:app/src/component/repetition_timer/routine_detail.dart';
import 'package:app/src/component/repetition_timer/timer_bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentRoutineTile extends StatelessWidget {
  const CurrentRoutineTile({
    required this.maxHeight,
    super.key,
  });

  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: const _CurrentAction(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                height: maxHeight,
                child: const _CurrentRoutineDetail(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrentAction extends StatelessWidget {
  const _CurrentAction();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) =>
          previous.completionCount != current.completionCount ||
          previous.isWorkTime != current.isWorkTime,
      builder: (context, state) {
        return SizedBox(
          child: _CurrentActionText(state),
        );
      },
    );
  }
}

class _CurrentActionText extends StatelessWidget {
  const _CurrentActionText(this.state);

  final TimerState state;

  @override
  Widget build(BuildContext context) {
    late String text;
    if (state.isDone) {
      text = 'finish!';
    } else {
      if (state.isWorkTime) {
        text = state.currentAction.name;
      } else {
        text = 'next: ${state.currentAction.name}';
      }
    }
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class _CurrentRoutineDetail extends StatelessWidget {
  const _CurrentRoutineDetail();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TimerBloc, TimerState, Routine>(
      selector: (state) => state.currentRoutine,
      builder: (context, currentRoutine) {
        return RoutineDetailView(currentRoutine);
      },
    );
  }
}
