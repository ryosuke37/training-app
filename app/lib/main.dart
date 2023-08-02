import 'package:app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:localizer/localizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TranslationProvider(child: const MyApp()));
}
