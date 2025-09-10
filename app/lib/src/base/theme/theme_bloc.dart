import 'package:assets/assets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './theme_event.dart';
part './theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ThemeUpdated>(_onThemeUpdated);
  }

  void _onThemeUpdated(ThemeUpdated event, Emitter<ThemeState> emit) {
    emit(ThemeState(event.theme));
  }
}
