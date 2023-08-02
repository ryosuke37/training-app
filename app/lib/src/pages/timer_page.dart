import 'package:app/src/component/timer/timer_dial.dart';
import 'package:flutter/cupertino.dart';
import 'package:localizer/localizer.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    const paddingRatio = 0.05;
    final timerDialSize = deviceWidth <= deviceHeight
        ? deviceWidth - (deviceWidth * paddingRatio * 2)
        : deviceHeight;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(t.timer),
      ),
      child: Center(
        child: TimerDial(size: timerDialSize),
      ),
    );
  }
}
