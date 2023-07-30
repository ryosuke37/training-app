import 'package:flutter/cupertino.dart';
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
        return const Color.fromARGB(255, 243, 243, 243);
      case Brightness.dark:
        return const Color.fromARGB(255, 20, 20, 20);
    }
  }
}

// extension CupertinoColorsEx on CupertinoColors {
//   static const CupertinoDynamicColor iconBackGround =
//       CupertinoDynamicColor.withBrightness(
//     debugLabel: 'iconBackGround',
//     color: Color(0xFF999999),
//     darkColor: Color(0xFF757575),
//   );

//   static const CupertinoDynamicColor icon =
//       CupertinoDynamicColor.withBrightness(
//     debugLabel: 'icon',
//     color: Color.fromARGB(255, 35, 35, 35),
//     darkColor: Color.fromARGB(255, 200, 200, 200),
//   );
// }

extension AppThemeEx on AppTheme {
  CupertinoThemeData get toCupertinoThemeData {
    switch (this) {
      case (AppTheme.greenLight):
        return CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green,
          barBackgroundColor: Brightness.light.barBackgroundColor,
          scaffoldBackgroundColor: Brightness.light.scaffoldBackgroundColor,
        );
      case (AppTheme.greenDark):
        return CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.green[700],
          barBackgroundColor: Brightness.dark.barBackgroundColor,
          scaffoldBackgroundColor: Brightness.dark.scaffoldBackgroundColor,
        );
      case (AppTheme.blueLight):
        return CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          barBackgroundColor: Brightness.light.barBackgroundColor,
          scaffoldBackgroundColor: Brightness.light.scaffoldBackgroundColor,
        );
      case (AppTheme.blueDark):
        return CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue[700],
          barBackgroundColor: Brightness.dark.barBackgroundColor,
          scaffoldBackgroundColor: Brightness.dark.scaffoldBackgroundColor,
        );
    }
  }
}
