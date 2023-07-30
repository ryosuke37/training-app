import 'package:flutter/cupertino.dart';

class RoundedRectIcon extends StatelessWidget {
  const RoundedRectIcon(
    this._iconData, {
    double size = double.infinity,
    Color iconColor = CupertinoColors.secondaryLabel,
    Color backGroundColor = CupertinoColors.systemBackground,
    bool drawBorder = true,
    Color borderColor = CupertinoColors.secondaryLabel,
    double radius = 10,
    super.key,
  })  : _width = size,
        _height = size,
        _iconColor = iconColor,
        _backGroundColor = backGroundColor,
        _borderColor = borderColor,
        _borderWidth = drawBorder ? 1 : 0,
        _radius = radius;

  final IconData _iconData;
  final double _width;
  final double _height;
  final Color _iconColor;
  final Color _backGroundColor;
  final Color _borderColor;
  final double _borderWidth;
  final double _radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(_backGroundColor, context)
            .withOpacity(1),
        border: Border.all(
          color: CupertinoDynamicColor.resolve(
            _borderColor,
            context,
          ).withOpacity(1),
          width: _borderWidth,
        ),
        borderRadius: BorderRadius.all(Radius.circular(_radius)),
      ),
      child: Icon(
        _iconData,
        color:
            CupertinoDynamicColor.resolve(_iconColor, context).withOpacity(1),
      ),
    );
  }
}
