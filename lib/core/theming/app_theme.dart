import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: ColorsManager.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 170, 47, 47),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: ColorsManager.secendryColor,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.secendryColor),
      fontFamily: 'Inter',
    );
  }
}
