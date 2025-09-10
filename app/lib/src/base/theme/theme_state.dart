part of './theme_bloc.dart';

class ThemeState {
  ThemeState(this.appTheme) : themeData = appTheme.toThemeData;
  ThemeState.initial()
      : appTheme = AppTheme.blueLight,
        themeData = AppTheme.blueLight.toThemeData;
  final ThemeData themeData;
  final AppTheme appTheme;
}
