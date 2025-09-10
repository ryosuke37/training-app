import 'dart:async';

typedef Callback = void Function();

class PausableTimer {
  PausableTimer(Duration duration, Callback callback)
      : _remainingDuration = duration,
        _stopwatch = Stopwatch(),
        _callback = callback,
        _timer = Timer(duration, callback),
        _isPausing = false {
    _stopwatch.start();
  }

  final Stopwatch _stopwatch;
  final Callback _callback;
  Timer _timer;
  Duration _remainingDuration;
  bool _isPausing;
  bool get isPausing => _isPausing;

  void pause() {
    _timer.cancel();
    _remainingDuration = _remainingDuration - _stopwatch.elapsed;
    _stopwatch.reset();
    _isPausing = true;
  }

  void resume() {
    if (!_isPausing) return;
    if (_remainingDuration > Duration.zero) {
      _timer = Timer(_remainingDuration, _callback);
      _stopwatch.start();
    }
  }

  void cancel() {
    _timer.cancel();
    _stopwatch.reset();
  }
}
