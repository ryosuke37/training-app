import 'package:app/src/settings/language_setting.dart';
import 'package:app/src/settings/theme_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:localizer/localizer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        middle: Text(S.of(context).settings),
      ),
      child: const Center(
        child: Settings(),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
      header: Text(S.of(context).settings),
      children: const [
        LanguageSettingTile(),
        ThemeSettingTile(),
      ],
    );
  }
}
