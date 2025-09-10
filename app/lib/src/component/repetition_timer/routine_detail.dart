import 'package:app/src/component/repetition_timer/time_data.dart';
import 'package:app/src/component/repetition_timer/timer_bloc/timer_bloc.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:localizer/localizer.dart';

class RoutineDetailView extends StatelessWidget {
  const RoutineDetailView(this.routine, {super.key});

  final Routine routine;

  Widget createTile({required Widget title, required Widget contents}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          title,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [contents],
          ),
        ],
      ),
    );
  }

  Widget get nameInfo => createTile(
        title: _WrappedText('${t.routineName} :'),
        contents: _WrappedText(routine.name),
      );

  Widget get descriptionInfo => createTile(
        title: _WrappedText('${t.description} :'),
        contents: _WrappedText(routine.description),
      );

  Widget get repeatNumInfo => createTile(
        title: _WrappedText('${t.repeatNum} :'),
        contents: _WrappedText(routine.repeatNum.toString()),
      );

  Widget createRoutineTile(Action action) => createTile(
        // title: Text(action.name),
        title: _WrappedText('[${action.name}]'),
        contents: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            _WrappedText(
              '${t.ready} : ${action.readyDuration.toDisplayString}',
            ),
            _WrappedText(
              '${t.workOut} : ${action.workDuration.toDisplayString}',
            ),
            const Divider(thickness: 1),
          ],
        ),
      );

  Widget get routineInfo => createTile(
        title: Text('${t.routineList} :'),
        contents: Column(
          children: routine.actions.map(createRoutineTile).toList(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 0.5),
        Expanded(
          child: ListView(
            children: [
              nameInfo,
              const Divider(thickness: 0.5),
              descriptionInfo,
              const Divider(thickness: 0.5),
              repeatNumInfo,
              const Divider(thickness: 0.5),
              routineInfo,
            ],
          ),
        ),
      ],
    );
  }
}

class _WrappedText extends StatelessWidget {
  const _WrappedText(this.data);

  final String data;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        child: Text(data),
      ),
    );
  }
}
