part of './timer_bloc.dart';

@immutable
abstract class TimerEvent extends Equatable {}

class TimerStarted extends TimerEvent {
  TimerStarted();

  @override
  List<Object?> get props => [];
}

class TimerStoped extends TimerEvent {
  TimerStoped();

  @override
  List<Object?> get props => [];
}

class TimerCanceled extends TimerEvent {
  TimerCanceled();

  @override
  List<Object?> get props => [];
}

class TimeChanged extends TimerEvent {
  TimeChanged({
    required this.hours,
    required this.minuts,
    required this.seconds,
  });

  final int hours;
  final int minuts;
  final int seconds;

  @override
  List<Object?> get props => [hours, minuts, seconds];
}
