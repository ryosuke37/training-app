part of './timer_bloc.dart';

@immutable
abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object?> get props => [];
}

class TimerStartButtonPressed extends TimerEvent {
  const TimerStartButtonPressed();
}

class TimerStopButtonPressed extends TimerEvent {
  const TimerStopButtonPressed();
}

class TimerCancelButtonPressed extends TimerEvent {
  const TimerCancelButtonPressed();
}

class _TimedUp extends TimerEvent {
  const _TimedUp();
}

class RoutineSet extends TimerEvent {
  const RoutineSet(this.index);
  final int index;

  @override
  List<Object?> get props => [index];
}

class ActionUpdated extends TimerEvent {
  const ActionUpdated({
    required this.routineIndex,
    required this.actionIndex,
    required this.action,
  });

  final int routineIndex;
  final int actionIndex;
  final Action action;

  @override
  List<Object?> get props => [routineIndex, actionIndex, action];
}

class RepeatNumSet extends TimerEvent {
  const RepeatNumSet({required this.routineIndex, required this.repeatNum});

  final int routineIndex;
  final int repeatNum;

  @override
  List<Object?> get props => [routineIndex, repeatNum];
}

class _FrameRefreshed extends TimerEvent {
  const _FrameRefreshed(this.elapsed);

  final Duration elapsed;

  @override
  List<Object?> get props => [elapsed];
}
