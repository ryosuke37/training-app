import 'package:app/src/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:localizer/localizer.dart';

enum MyTab {
  home,
  graph,
  timer,
  settings,
}

extension MyTabEx on MyTab {
  BottomNavigationBarItem bottomNavigationBarItem(BuildContext context) {
    switch (this) {
      case (MyTab.home):
        return BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.home),
          label: S.of(context).home,
        );
      case (MyTab.graph):
        return BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.graph_square),
          label: S.of(context).graph,
        );
      case (MyTab.timer):
        return BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.timer),
          label: t.timer,
        );
      case (MyTab.settings):
        return BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.gear),
          label: S.of(context).settings,
        );
    }
  }

  Widget get toPage {
    switch (this) {
      case MyTab.home:
        return const HomePage();
      case MyTab.graph:
        return const GraphPage();
      case MyTab.timer:
        return const TimerPage();
      case MyTab.settings:
        return const SettingsPage();
    }
  }
}
