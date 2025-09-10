import 'package:app/src/component/repetition_timer/current_routine_tile.dart';
import 'package:app/src/component/repetition_timer/timer_controller.dart';
import 'package:app/src/component/repetition_timer/timer_dial.dart';
import 'package:common_component/common_component.dart';
import 'package:flutter/material.dart';

class RepetitionTimer extends StatelessWidget {
  const RepetitionTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return const RepetitionTimerView();
  }
}

class RepetitionTimerView extends StatelessWidget {
  const RepetitionTimerView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = blockWidth(context) * 100;
    final height = blockHeight(context) * 100;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            TimerDial(
              context: context,
              size: width < height ? width * 0.4 : height * 0.4,
            ),
            const TimerController(),
          ],
        ),
        SizedBox(
          height: height * 0.05,
        ),
        SizedBox(
          width: width * 0.8,
          child: CurrentRoutineTile(
            maxHeight: height * 0.2,
          ),
        ),
      ],
    );
  }
}
