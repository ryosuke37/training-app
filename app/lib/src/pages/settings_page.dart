import 'package:app/src/settings/language_setting.dart';
import 'package:app/src/settings/theme_setting.dart';
import 'package:common_component/common_component.dart';
import 'package:flutter/material.dart';
import 'package:localizer/localizer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.settings),
        title: Text(S.of(context).settings),
      ),
      body: const Center(
        child: Settings(),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListSection(
          children: [
            LanguageSettingTile(),
            ThemeSettingTile(),
          ],
        ),
      ],
    );
  }
}
