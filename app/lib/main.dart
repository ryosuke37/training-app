import 'package:app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localizer/localizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);
  runApp(TranslationProvider(child: const MyApp()));
}
