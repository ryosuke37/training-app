import 'package:flutter/widgets.dart';

double blockWidth(BuildContext context) {
  return MediaQuery.of(context).size.width / 100;
}

double blockHeight(BuildContext context) {
  return MediaQuery.of(context).size.height / 100;
}
