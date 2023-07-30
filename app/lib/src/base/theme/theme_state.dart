part of './theme_bloc.dart';

class ThemeState {
  ThemeState(this.appTheme)
      : cupertinoThemeData = appTheme.toCupertinoThemeData;
  ThemeState.initial()
      : appTheme = AppTheme.blueLight,
        cupertinoThemeData = AppTheme.blueLight.toCupertinoThemeData;
  final CupertinoThemeData cupertinoThemeData;
  final AppTheme appTheme;
}
