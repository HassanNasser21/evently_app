import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF5669FF);
  static const Color background_light = Color(0xFFF2FEFF);
  static const Color background_dart = Color(0xFF101127);
  static const Color white = Color(0xFFF2FEFF);
  static const Color black = Color(0xFF1C1C1C);
  static const Color gray = Color(0xFF7B7B7B);
  static const Color red = Color(0xFFFF5659);

  static ThemeData lighttheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      selectedItemColor: white,
      unselectedItemColor: white,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: white,
      shape: CircleBorder(
        side: BorderSide(
          color: white,
          width: 5,
        ),
      ),
    ),
  );
  static ThemeData darktheme = ThemeData();
}
