import 'package:flutter/material.dart';

class ListTileArrow extends StatelessWidget {
  const ListTileArrow({super.key, double? size}) : _size = size;

  final double? _size;

  @override
  Widget build(BuildContext context) {
    final size = _size ?? 12.0;
    return Icon(
      Icons.arrow_forward_ios_rounded,
      color: Theme.of(context).unselectedWidgetColor,
      size: size,
    );
  }
}
