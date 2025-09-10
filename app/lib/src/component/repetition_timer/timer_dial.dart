import 'dart:math';

import 'package:app/src/component/repetition_timer/timer_bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerDial extends StatelessWidget {
  const TimerDial({required this.context, required this.size, super.key});

  final BuildContext context;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _TimerCircleBaseView(size),
        _CurrentTimeView(size),
      ],
    );
  }
}

class _TimerCircleBaseView extends StatelessWidget {
  const _TimerCircleBaseView(this.size);

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: const _BaseCirclePainter(),
    );
  }
}

class _BaseCirclePainter extends CustomPainter {
  const _BaseCirclePainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    final baseCirclePaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    canvas.drawCircle(Offset.zero, size.width / 2, baseCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _CurrentTimeView extends StatelessWidget {
  const _CurrentTimeView(this.size);

  final double size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) {
        return previous.currentActionDuration !=
                current.currentActionDuration ||
            previous.elapsedTime != current.elapsedTime;
      },
      builder: (context, state) {
        final color = state.isWorkTime
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary;
        final sweepAngle = state.isWorkTime
            ? (state.elapsedTime.inMilliseconds /
                    state.currentActionDuration.inMilliseconds) *
                (2 * pi)
            : ((state.currentActionDuration.inMilliseconds -
                        state.elapsedTime.inMilliseconds) /
                    state.currentActionDuration.inMilliseconds) *
                (2 * pi);
        debugPrint('sweepAngle: $sweepAngle');
        return CustomPaint(
          size: Size(size, size),
          painter: _CurrentTimePainter(
            color: color,
            sweepAngle: sweepAngle,
            leftAdjust: state.isWorkTime,
          ),
        );
      },
    );
  }
}

class _CurrentTimePainter extends CustomPainter {
  _CurrentTimePainter({
    required this.color,
    required this.sweepAngle,
    required bool leftAdjust,
  }) : startAngle = leftAdjust ? -pi / 2 : (3 / 2) * pi - sweepAngle;

  final Color color;
  final double startAngle;
  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    final timerCirclePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCenter(
      center: Offset.zero,
      width: size.width,
      height: size.height,
    );

    final timerPath = Path()..arcTo(rect, startAngle, sweepAngle, true);
    canvas.drawPath(timerPath, timerCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
