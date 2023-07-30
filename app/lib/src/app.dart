import 'package:app/src/base/theme/theme_bloc.dart';
import 'package:app/src/pages/pages.dart';
import 'package:app/src/tab/tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localizer/localizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: const _FoundationSwitcher(),
    );
  }
}

class _FoundationSwitcher extends StatelessWidget {
  const _FoundationSwitcher();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) => CupertinoApp(
        // Without the key, the rebuild is not rund when switching languages.
        key: GlobalKey(),
        title: 'Flutter Demo',
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        theme: themeState.cupertinoThemeData,
        home: const Scaffold(body: _TabScaffold()),
      ),
    );
  }
}

class _TabScaffold extends StatefulWidget {
  const _TabScaffold();

  @override
  State<_TabScaffold> createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<_TabScaffold> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: MyTab.values.map((e) => e.bottomNavigationBarItem).toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) => MyTab.values[index].toPage,
        );
      },
    );
  }
}

extension MyTabToPage on MyTab {
  Widget get toPage {
    switch (this) {
      case MyTab.home:
        return const HomePage();
      case MyTab.graph:
        return const GraphPage();
      case MyTab.settings:
        return const SettingsPage();
    }
  }
}
