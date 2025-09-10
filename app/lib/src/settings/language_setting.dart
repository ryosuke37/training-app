import 'package:common_component/common_component.dart';
import 'package:flutter/material.dart';
import 'package:localizer/localizer.dart';

class LanguageSettingTile extends StatelessWidget {
  const LanguageSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).language),
      leading: const Icon(Icons.abc),
      trailing: const ListTileArrow(),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return const _LanguageSettingPage();
          },
        ),
      ),
    );
  }
}

class _LanguageSettingPage extends StatelessWidget {
  const _LanguageSettingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(S.of(context).language),
      ),
      body: ListView(
        children: [
          ListSection(
            children: AppLocale.values
                .map(
                  (element) => ListTile(
                    title: Text(element.toDisplayString(context)),
                    trailing: element == LocaleSettings.currentLocale
                        ? Icon(
                            Icons.check_rounded,
                            color: Theme.of(context).primaryColor,
                          )
                        : const SizedBox.shrink(),
                    onTap: () => LocaleSettings.setLocale(element),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

extension on AppLocale {
  String toDisplayString(BuildContext context) {
    switch (this) {
      case AppLocale.en:
        return S.of(context).english;
      case AppLocale.ja:
        return S.of(context).japanese;
    }
  }
}
