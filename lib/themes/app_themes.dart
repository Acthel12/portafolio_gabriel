import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData mikuLightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFBEC8D1),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF137A7F),
      onPrimary: Colors.white,
      secondary: Color(0xFFE12885),
      onSecondary: Colors.white,
      tertiary: Color(0xFF86CECB),
      onTertiary: Color(0xFF373B3E),
      surface: Colors.white,
      onSurface: Color(0xFF373B3E),
      error: Colors.red,
      onError: Colors.white,
    ),
  );
  static ThemeData tetoDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF06053B),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFF0045),
    onPrimary: Colors.white,
    secondary: Color(0xFFD924D5),
    onSecondary: Colors.white,
    tertiary: Color(0xFFEDA7BA),
    onTertiary: Color(0xFF06053B),
    surface: Color(0xFF3F4750),
    onSurface: Colors.white,
    error: Colors.redAccent,
    onError: Colors.black,
  ),
);
}
