import 'package:flutter/material.dart';
import 'package:int_news/core/theming/colors.dart';
import 'package:int_news/core/theming/font_weight.dart';

abstract class TextStylesManager {
  // ------------------------- font 8 ------------------------------//
  static TextStyle font8BlueRegular = TextStyle(
    color: ColorsManager.primaryColor,
    fontSize: 8,
    fontWeight: FontWeightManager.regular,
  );
}
