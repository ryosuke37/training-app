import 'package:flutter/scheduler.dart';

class PausableTicker extends Ticker {
  PausableTicker(void Function(Duration elapsed) onTick)
      : super((elapsed) {
          onTick(elapsed - _pauseDuration);
        });

  static Duration _pauseDuration = Duration.zero;
  late Duration _pauseStartTime;

  @override
  TickerFuture start() {
    _pauseDuration = Duration.zero;
    muted = false;
    return super.start();
  }

  void pause() {
    if (isActive && muted == false) {
      SchedulerBinding.instance
          .scheduleFrameCallback((timeStamp) => _pauseStartTime = timeStamp);
      muted = true;
    }
  }

  void resume() {
    if (isActive && muted == true) {
      SchedulerBinding.instance.scheduleFrameCallback(
        (timeStamp) =>
            _pauseDuration = (timeStamp - _pauseStartTime) + _pauseDuration,
      );
      muted = false;
    }
  }
}
