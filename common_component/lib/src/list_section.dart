import 'package:flutter/material.dart';

class ListSection extends StatelessWidget {
  const ListSection({
    required List<Widget?> children,
    super.key,
    Widget? title,
    double? topPadding,
    double? sidePadding,
    BorderRadius? borderRadius,
    double? dividerMargin,
    double? dividerThickness,
    Color? dividerColor,
    Color? backgroundColor,
  })  : _children = children,
        _title = title,
        _topPadding = topPadding,
        _sidePadding = sidePadding,
        _borderRadius = borderRadius,
        _dividerMargin = dividerMargin,
        _dividerThickness = dividerThickness,
        _dividerColor = dividerColor,
        _backgroundColor = backgroundColor;

  final List<Widget?> _children;
  final Widget? _title;
  final double? _topPadding;
  final double? _sidePadding;
  final BorderRadius? _borderRadius;
  final double? _dividerMargin;
  final double? _dividerThickness;
  final Color? _dividerColor;
  final Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    final topPadding = _topPadding ?? 10.0;
    final sidePadding = _sidePadding ?? 20.0;
    final borderRadius =
        _borderRadius ?? const BorderRadius.all(Radius.circular(15));
    final dividerMargin = _dividerMargin ?? 0.0;
    final dividerThickness = _dividerThickness ?? 2.0;
    final dividerColor = _dividerColor ?? Colors.black.withAlpha(0);
    final backgroundColor =
        _backgroundColor ?? Theme.of(context).colorScheme.surface;

    final divider = SizedBox(
      height: dividerThickness,
      child: Row(
        children: [
          Container(
            width: dividerMargin,
            color: backgroundColor,
          ),
          Expanded(
            child: Container(
              color: dividerColor,
            ),
          ),
        ],
      ),
    );

    final widgetList = <Widget>[];

    for (var i = 0; i < _children.length; i++) {
      widgetList.add(
        Container(
          width: double.infinity,
          color: backgroundColor,
          child: _children.elementAt(i),
        ),
      );
      if (i != _children.length - 1) {
        widgetList.add(divider);
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: sidePadding,
        right: sidePadding,
      ),
      child: Column(
        children: [
          if (_title != null)
            Row(children: [const SizedBox(width: 10), _title!]),
          ClipRRect(
            borderRadius: borderRadius,
            child: Column(
              children: widgetList,
            ),
          ),
        ],
      ),
    );
  }
}
