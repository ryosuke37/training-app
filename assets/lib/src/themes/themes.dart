import 'package:flutter/material.dart';

enum AppTheme {
  greenLight,
  greenDark,
  blueLight,
  blueDark,
}

extension on Brightness {
  Color get barBackgroundColor {
    switch (this) {
      case Brightness.light:
        return Colors.white;
      case Brightness.dark:
        return Colors.black;
    }
  }

  Color get scaffoldBackgroundColor {
    switch (this) {
      case Brightness.light:
        return const Color.fromARGB(255, 240, 240, 240);
      case Brightness.dark:
        return const Color.fromARGB(255, 20, 20, 20);
    }
  }
}

extension AppThemeEx on AppTheme {
  ThemeData get toThemeData {
    switch (this) {
      case (AppTheme.greenLight):
        return _getThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
        );
      case (AppTheme.greenDark):
        return _getThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
        );
      case (AppTheme.blueLight):
        return _getThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        );
      case (AppTheme.blueDark):
        return _getThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        );
    }
  }
}

ThemeData _getThemeData({
  required Brightness brightness,
  required MaterialColor primarySwatch,
}) {
  return ThemeData(
    useMaterial3: true,
    primaryColor: primarySwatch,
    primarySwatch: primarySwatch,
    brightness: brightness,
    colorScheme:
        ColorScheme.fromSeed(seedColor: primarySwatch, brightness: brightness),
    scaffoldBackgroundColor: brightness.scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(elevation: 5, scrolledUnderElevation: 50),
    navigationBarTheme: const NavigationBarThemeData(elevation: 10),
  );
}
