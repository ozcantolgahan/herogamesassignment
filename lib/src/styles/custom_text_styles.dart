import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/constants/config.dart';

class CustomTextStyles {
  static TextStyle get titleTextStyle => TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24.sp);
  static TextStyle get hintTextStyle => TextStyle(
      color: Config.hintTextColor, fontSize: 16.w, fontWeight: FontWeight.w400);
  static TextStyle get defaultPrimaryButtonTextStyle => TextStyle(
      color: Colors.white, fontSize: 16.w, fontWeight: FontWeight.w600);
  static TextStyle get inputTextStyle => TextStyle(
      color: Config.inputTextColor,
      fontSize: 16.w,
      fontWeight: FontWeight.w400);
  static TextStyle get labelTextStyle => TextStyle(
      color: Config.labelTextColor,
      fontSize: 14.w,
      fontWeight: FontWeight.w400);
  static TextStyle get primaryTextStyle => TextStyle(
      color: Config.primaryTextColor,
      fontSize: 16.w,
      fontWeight: FontWeight.w500);
}
