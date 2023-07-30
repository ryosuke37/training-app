import 'package:flutter/cupertino.dart';
import 'package:localizer/localizer.dart';

enum MyTab {
  home,
  graph,
  settings,
}

extension MyTabEx on MyTab {
  BottomNavigationBarItem get bottomNavigationBarItem {
    switch (this) {
      case (MyTab.home):
        return BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.home),
          label: t.home,
        );
      case (MyTab.graph):
        return BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.graph_square),
          label: t.graph,
        );
      case (MyTab.settings):
        return BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.gear),
          label: t.settings,
        );
    }
  }
}
