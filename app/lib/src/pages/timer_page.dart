import 'package:app/src/component/timer_dial.dart';
import 'package:flutter/cupertino.dart';
import 'package:localizer/localizer.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    const paddingRatio = 0.05;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(t.timer),
      ),
      child: Center(
        child: TimerDial(size: deviceWidth - paddingRatio * 2),
      ),
    );
  }
}
