import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/constants/config.dart';

class CustomBoxDecorationStyles {
  static BoxDecoration get defaultCardDecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(16.w), color: Config.secondaryColor);
  static EdgeInsets get defaultCardPadding => EdgeInsets.all(24.w);
  static EdgeInsets get defaultCardPaddingOnlyHorizontal =>
      EdgeInsets.symmetric(horizontal: 24.w);
}
