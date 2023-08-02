import 'dart:math';

import 'package:flutter/cupertino.dart';

class TimerDial extends StatelessWidget {
  const TimerDial({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const _TimerCircle(),
    );
  }
}

class _TimerCircle extends StatefulWidget {
  const _TimerCircle();

  @override
  State<_TimerCircle> createState() => _TimerCircleState();
}

class _TimerCircleState extends State<_TimerCircle>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final color = CupertinoTheme.of(context).primaryColor;
    return CustomPaint(
      painter: _TimerCirclePainter(color, _animation.value),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _TimerCirclePainter extends CustomPainter {
  _TimerCirclePainter(this.color, double sweepAngle)
      : sweepAngle = sweepAngle != (2 * pi) ? sweepAngle : (2 * pi * 0.999);

  final Color color;
  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCenter(
      center: Offset.zero,
      width: size.width,
      height: size.height,
    );

    final path = Path()..arcTo(rect, -pi / 2, sweepAngle, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
