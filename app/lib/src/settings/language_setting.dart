import 'package:common_ui/common_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:localizer/localizer.dart';

class LanguageSettingTile extends StatelessWidget {
  const LanguageSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Text(t.language),
      leading: const RoundedRectIcon(CupertinoIcons.globe),
      trailing: const CupertinoListTileChevron(),
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute<void>(
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        middle: Text(S.of(context).language),
      ),
      child: CupertinoListSection.insetGrouped(
        dividerMargin: 0,
        additionalDividerMargin: 0,
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        children: AppLocale.values
            .map(
              (element) => CupertinoListTile.notched(
                title: Text(element.toDisplayString(context)),
                trailing: element == LocaleSettings.currentLocale
                    ? Icon(
                        CupertinoIcons.check_mark,
                        color: CupertinoTheme.of(context).primaryColor,
                      )
                    : const SizedBox.shrink(),
                onTap: () => LocaleSettings.setLocale(element),
              ),
            )
            .toList(),
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
