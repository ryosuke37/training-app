import 'package:app/src/base/theme/theme_bloc.dart';
import 'package:assets/assets.dart';
import 'package:common_component/common_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizer/localizer.dart';

class ThemeSettingTile extends StatelessWidget {
  const ThemeSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).theme),
      leading: const Icon(Icons.brush),
      trailing: const ListTileArrow(),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(t.theme),
      ),
      body: ListSection(
        children: AppTheme.values.map(
          (element) {
            final isSelected = element == themeBloc.state.appTheme;
            return ListTile(
              title: Text(element.toDisplayString(context)),
              leading: _ThemeIcon(element),
              trailing: isSelected
                  ? Icon(
                      Icons.check_rounded,
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
  _ThemeIcon(AppTheme appTheme) : theme = appTheme.toThemeData;

  final ThemeData theme;
  final double size = 30;
  final double border = 1;
  final double radius = 10;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: Container(
        padding: EdgeInsets.all(border),
        color: theme.colorScheme.primary,
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius - border)),
          child: SizedBox.expand(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: theme.colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: theme.colorScheme.surface,
                  ),
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
