import 'package:flutter/material.dart';
import 'package:int_news/core/theming/colors.dart';
import 'package:int_news/core/theming/font_weight.dart';

abstract class TextStylesManager {
  // ------------------------- font 8 ------------------------------//
  static TextStyle font8PrimaryColorRegular = TextStyle(
    color: ColorsManager.primaryColor,
    fontSize: 8,
    fontWeight: FontWeightManager.regular,
  );
  static TextStyle font20WhiteBold = TextStyle(
    color: ColorsManager.white,
    fontSize: 20,
    fontWeight: FontWeightManager.bold,
  );

  static TextStyle font22WhiteBold = TextStyle(
    color: ColorsManager.white,
    fontSize: 22,
    fontWeight: FontWeightManager.bold,
  );

  static TextStyle font18PrimayColorSemiBold = TextStyle(
    color: ColorsManager.primaryColor,
    fontSize: 18,
    fontWeight: FontWeightManager.semiBold,
  );
  static TextStyle font16BlackBold = TextStyle(
    color: ColorsManager.black,
    fontSize: 16,
    fontWeight: FontWeightManager.bold,
  );

  static TextStyle font14GreykRegular = TextStyle(
    color: ColorsManager.grey,
    fontSize: 14,
    fontWeight: FontWeightManager.regular,
  );

  static TextStyle font14WhiteBold = TextStyle(
    color: ColorsManager.white,
    fontSize: 14,
    fontWeight: FontWeightManager.bold,
  );
}
