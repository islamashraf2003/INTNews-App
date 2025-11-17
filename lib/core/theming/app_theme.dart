import 'package:flutter/material.dart';
import 'package:int_news/core/theming/colors.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFF34C54);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: ColorsManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorsManager.white),
      titleTextStyle: TextStyle(
        color: ColorsManager.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
  );
}
