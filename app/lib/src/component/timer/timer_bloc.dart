import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './timer_event.dart';

class ThemeBloc extends Bloc<TimerEvent, int> {
  ThemeBloc() : super(0) {
    on<TimeChanged>(_onThemeUpdated);
  }

  void _onThemeUpdated(TimeChanged event, Emitter<int> emit) {
    emit(0);
  }
}
