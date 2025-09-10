import 'package:app/src/component/repetition_timer/timer_bloc/timer_bloc.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizer/localizer.dart';

class RoutineSetter extends StatelessWidget {
  const RoutineSetter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TimerBloc, TimerState, List<Routine>>(
      selector: (state) => state.routines,
      builder: (context, routines) {
        final routineTiles = <Widget>[];
        for (var index = 0; index < routines.length; index++) {
          routineTiles.add(_RoutineTile(routines, index));
        }
        return Padding(
          padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.routineList,
                style: const TextStyle(fontSize: 15),
              ),
              ...routineTiles,
            ],
          ),
        );
      },
    );
  }
}

class _RoutineTile extends StatelessWidget {
  const _RoutineTile(this.routines, this.index);

  final List<Routine> routines;
  final int index;

  @override
  Widget build(BuildContext context) {
    final routine = routines[index];
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 0,
      child: ListTile(
        onTap: () {
          context.read<TimerBloc>().add(RoutineSet(index));
        },
        title: Text(routine.name),
      ),
    );
  }
}
