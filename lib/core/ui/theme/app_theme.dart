import 'package:flutter/material.dart';

class AppTheme {
  static const String lightThemeName = "light";
  static const String darkThemeName = "dark";

  static bool get isDark => darkThemeName == themeSelected;
  static bool get isLight => lightThemeName == themeSelected;

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: Typography(platform: TargetPlatform.iOS).black);
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF121212),
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: Typography(platform: TargetPlatform.iOS).white);

  static String themeSelected = "light";
}
