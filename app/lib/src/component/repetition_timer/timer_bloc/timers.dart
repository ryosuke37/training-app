import 'package:common_component/common_component.dart';

typedef Callback = void Function();

class Timers {
  Timers(this._viewTicker, Map<Duration, Callback> callbacks)
      : _callbacks = callbacks;

  final PausableTicker _viewTicker;
  final Map<Duration, Callback> _callbacks;
  final List<PausableTimer> _notifyTimers = [];

  bool _isAlreadyStarted = false;
  bool get isAlreadyStarted => _isAlreadyStarted;

  void start() {
    _isAlreadyStarted = true;
    _viewTicker.start();
    _callbacks.forEach((duration, callback) {
      _notifyTimers.add(PausableTimer(duration, callback));
    });
  }

  void pause() {
    _viewTicker.pause();
    for (final notifyTimer in _notifyTimers) {
      notifyTimer.pause();
    }
  }

  void resume() {
    _viewTicker.resume();
    for (final notifyTimer in _notifyTimers) {
      notifyTimer.resume();
    }
  }

  void stop() {
    _viewTicker.stop();
    for (final notifyTimer in _notifyTimers) {
      notifyTimer.cancel();
    }
  }
}
