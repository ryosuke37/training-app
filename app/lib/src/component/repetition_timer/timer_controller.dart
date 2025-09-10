import 'package:app/src/component/repetition_timer/timer_bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerController extends StatelessWidget {
  const TimerController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TimerBloc, TimerState, bool>(
      selector: (state) => state.isMoving,
      builder: (context, isTimerMoving) {
        final iconData =
            isTimerMoving ? Icons.pause_rounded : Icons.play_arrow_rounded;

        return IconButton(
          onPressed: () {
            if (isTimerMoving) {
              context.read<TimerBloc>().add(const TimerStopButtonPressed());
            } else {
              context.read<TimerBloc>().add(const TimerStartButtonPressed());
            }
          },
          icon: Icon(
            iconData,
            size: 30,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        );
      },
    );
  }
}
