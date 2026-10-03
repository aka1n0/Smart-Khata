import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF176B5B), brightness: Brightness.light, scaffoldBackgroundColor: const Color(0xFFF6F8F7), inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14)))));
  static ThemeData dark = ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF5ED8C0), brightness: Brightness.dark, inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14)))));
}
