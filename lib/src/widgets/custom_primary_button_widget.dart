import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/constants/config.dart';
import 'package:hero_games_assignment/src/styles/custom_text_styles.dart';
import 'package:hero_games_assignment/src/widgets/custom_text_widget.dart';

class CustomPrimaryButtonWidget extends StatelessWidget {
  const CustomPrimaryButtonWidget({super.key, required this.title, this.onTap});
  final title;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: double.infinity,
        height: 56.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: Config.activeColor),
        child: Center(
          child: CText(
            title,
            style: CustomTextStyles.defaultPrimaryButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
