import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
    );
  }
}
