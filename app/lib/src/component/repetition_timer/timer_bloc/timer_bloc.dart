import 'dart:async';

import 'package:app/src/component/repetition_timer/timer_bloc/timers.dart';
import 'package:common_component/common_component.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './timer_event.dart';
part './timer_state.dart';

typedef _Callback = void Function();
void _soundBuzzer() => debugPrint('sound Buzzer');

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerState.initial()) {
    _timerInit();

    on<_FrameRefreshed>(_onFrameRefreshed);
    on<_TimedUp>(_onTimedUp);
    on<TimerStartButtonPressed>(_onTimerStartButtonPressed);
    on<TimerStopButtonPressed>(_onTimerStopButtonPressed);
    on<TimerCancelButtonPressed>(_onTimerCancelButtonPressed);
    on<ActionUpdated>(_onActionUpdated);
    on<RepeatNumSet>(_onRepeatNumUpdated);
    on<RoutineSet>(_onRoutineSet);
  }

  late Timers _timers;

  Map<Duration, _Callback> get _buzzerSoundTimeMap {
    final soundSeconds = <int>[2, 1];
    final buzzerMap = <Duration, _Callback>{};
    for (final seconds in soundSeconds) {
      final soundTime =
          state.currentActionDuration - Duration(seconds: seconds);
      buzzerMap[soundTime] = _soundBuzzer;
    }
    return buzzerMap;
  }

  void _timerInit() {
    _timers = Timers(
      PausableTicker((elapsed) => add(_FrameRefreshed(elapsed))),
      _buzzerSoundTimeMap,
    );
  }

  Future<void> _onFrameRefreshed(
    _FrameRefreshed event,
    Emitter<TimerState> emit,
  ) async {
    final timedUp = state.currentActionDuration <= event.elapsed;
    final elapsedTime = timedUp ? state.currentActionDuration : event.elapsed;
    emit(state.copyWith(elapsedTime: elapsedTime));
    if (timedUp) {
      add(const _TimedUp());
    }
  }

  Future<void> _onTimedUp(_TimedUp event, Emitter<TimerState> emit) async {
    emit(state.nextState);
    _timers.stop();
    _timerInit();
    if (state.isMoving) {
      _timers.start();
    }
  }

  Future<void> _onTimerStartButtonPressed(
    TimerStartButtonPressed event,
    Emitter<TimerState> emit,
  ) async {
    if (!state.isDone) {
      if (_timers.isAlreadyStarted) {
        _timers.resume();
      } else {
        _timers.start();
      }

      emit(state.start);
    }
  }

  Future<void> _onTimerStopButtonPressed(
    TimerStopButtonPressed event,
    Emitter<TimerState> emit,
  ) async {
    _timers.pause();
    emit(state.stop);
  }

  Future<void> _onTimerCancelButtonPressed(
    TimerCancelButtonPressed event,
    Emitter<TimerState> emit,
  ) async {
    _timers.stop();
    emit(
      state.copyWith(
        completionCount: 0,
        currentActionIndex: 0,
        isWorkTime: false,
        isMoving: false,
        elapsedTime: Duration.zero,
      ),
    );
  }

  Future<void> _onActionUpdated(
    ActionUpdated event,
    Emitter<TimerState> emit,
  ) async {
    _timers.stop();
    emit(
      state.stop.resetCounter.updateAction(
        routineIndex: event.routineIndex,
        actionIndex: event.actionIndex,
        newAction: event.action,
      ),
    );
  }

  Future<void> _onRepeatNumUpdated(
    RepeatNumSet event,
    Emitter<TimerState> emit,
  ) async {
    _timers.stop();
    emit(
      state.stop.resetCounter.resetElapsedTime.updateRepeatNum(
        routineIndex: event.routineIndex,
        newRepeatNum: event.repeatNum,
      ),
    );
  }

  Future<void> _onRoutineSet(
    RoutineSet event,
    Emitter<TimerState> emit,
  ) async {
    _timers.stop();
    _timerInit();
    emit(
      state.stop.resetCounter.resetElapsedTime
          .copyWith(currentRoutineIndex: event.index),
    );
  }
}
