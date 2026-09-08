import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,

        primary: Color(0xffE0A23A),
        onPrimary: Colors.white,
        secondary: Color.fromARGB(255, 53, 109, 70),
        onSecondary: Colors.white,
        error: Color(0xffD6543F),
        onError: Colors.white,
        surface: Color(0xffFAF6EF),
        surfaceContainer: Colors.white,
        surfaceContainerHighest: Color.fromARGB(240, 255, 255, 255),

        onSurface: Colors.black87,
        shadow: Colors.black,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color.fromARGB(255, 3, 149, 93),
        onPrimary: Colors.white,

        secondary: Color.fromARGB(255, 152, 70, 220),
        onSecondary: Colors.white,

        error: Color(0xFFE52E2E),
        onError: Colors.white,

        surface: Color(0xFF10141D),
        surfaceContainer: Color.fromARGB(255, 39, 39, 49),
        surfaceContainerHighest: Color.fromARGB(240, 50, 50, 50),
        onSurface: Color(0xFFEFF2F7),
        shadow: Colors.white,
      ),
    );
  }
}
