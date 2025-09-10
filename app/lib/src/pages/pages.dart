import 'package:app/src/pages/graph_page.dart';
import 'package:app/src/pages/home_page.dart';
import 'package:app/src/pages/settings_page.dart';
import 'package:app/src/pages/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:localizer/localizer.dart';

enum Destination {
  home,
  graph,
  timer,
  settings,
}

extension MyPageEx on Destination {
  NavigationDestination navigationDestination(BuildContext context) {
    switch (this) {
      case (Destination.home):
        return NavigationDestination(
          icon: const Icon(Icons.home_rounded),
          label: S.of(context).home,
        );
      case (Destination.graph):
        return NavigationDestination(
          icon: const Icon(Icons.auto_graph_rounded),
          label: S.of(context).graph,
        );
      case (Destination.timer):
        return NavigationDestination(
          icon: const Icon(Icons.timer_rounded),
          label: t.timer,
        );
      case (Destination.settings):
        return NavigationDestination(
          icon: const Icon(Icons.settings_rounded),
          label: S.of(context).settings,
        );
    }
  }

  Widget toPage() {
    switch (this) {
      case Destination.home:
        return const HomePage();
      case Destination.graph:
        return const GraphPage();
      case Destination.timer:
        return const TimerPage();
      case Destination.settings:
        return const SettingsPage();
    }
  }
}
