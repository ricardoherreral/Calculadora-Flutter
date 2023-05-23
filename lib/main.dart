import 'package:calculadora/pages/home_page.dart';
import 'package:calculadora/theme/theme_constants.dart';
import 'package:calculadora/theme/theme_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
