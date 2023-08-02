import 'package:app/src/base/theme/theme_bloc.dart';
import 'package:assets/assets.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizer/localizer.dart';

class ThemeSettingTile extends StatelessWidget {
  const ThemeSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Text(S.of(context).theme),
      leading: const RoundedRectIcon(CupertinoIcons.paintbrush),
      trailing: const CupertinoListTileChevron(),
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (BuildContext context) {
            return const _ThemeSettingPage();
          },
        ),
      ),
    );
  }
}

class _ThemeSettingPage extends StatelessWidget {
  const _ThemeSettingPage();

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    final theme = CupertinoTheme.of(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: theme.barBackgroundColor,
        middle: Text(t.theme),
      ),
      child: CupertinoListSection.insetGrouped(
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        children: AppTheme.values.map(
          (element) {
            final isSelected = element == themeBloc.state.appTheme;
            return CupertinoListTile.notched(
              title: Text(element.toDisplayString(context)),
              leading: _ThemeIcon(element),
              trailing: isSelected
                  ? Icon(
                      CupertinoIcons.check_mark,
                      color: theme.primaryColor,
                    )
                  : const SizedBox.shrink(),
              onTap: () => themeBloc.add(ThemeUpdated(theme: element)),
            );
          },
        ).toList(),
      ),
    );
  }
}

class _ThemeIcon extends StatelessWidget {
  _ThemeIcon(AppTheme appTheme) : theme = appTheme.toCupertinoThemeData;

  final CupertinoThemeData theme;
  final double border = 1;
  final double radius = 10;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: Container(
        padding: EdgeInsets.all(border),
        color: theme.primaryColor,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius - border)),
          child: SizedBox.expand(
            child: Row(
              children: [
                Expanded(
                  child: Container(color: theme.primaryColor),
                ),
                Expanded(
                  child: Container(color: theme.barBackgroundColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on AppTheme {
  String toDisplayString(BuildContext context) {
    switch (this) {
      case AppTheme.blueDark:
        return S.of(context).blueDark;
      case AppTheme.blueLight:
        return S.of(context).blueLight;
      case AppTheme.greenDark:
        return S.of(context).greenDark;
      case AppTheme.greenLight:
        return S.of(context).greenLight;
    }
  }
}
