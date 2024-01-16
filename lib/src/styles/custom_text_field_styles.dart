import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/constants/config.dart';

class CustomTextFieldStyles {
  static OutlineInputBorder get defaultBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.w),
      borderSide: BorderSide(color: Config.inputBorderColor, width: 1.w));
  static OutlineInputBorder get focusedBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.w),
      borderSide: BorderSide(color: Config.activeColor, width: 1.w));
}
