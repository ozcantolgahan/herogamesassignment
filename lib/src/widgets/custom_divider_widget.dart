import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/constants/config.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.w,
      width: double.infinity,
      decoration:
          BoxDecoration(border: Border.all(color: Config.inputBackgroundColor)),
    );
  }
}
