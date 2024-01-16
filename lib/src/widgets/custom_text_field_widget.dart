import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/constants/config.dart';
import 'package:hero_games_assignment/src/helper/custom_image_helper.dart';
import 'package:hero_games_assignment/src/helper/time_helper.dart';
import 'package:hero_games_assignment/src/store/authentication_store.dart';
import 'package:hero_games_assignment/src/styles/custom_text_field_styles.dart';
import 'package:hero_games_assignment/src/styles/custom_text_styles.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {super.key,
      this.customPrefixIcon,
      required this.hintTitle,
      this.customSuffixIcon,
      this.isDate,
      this.isBio,
      this.controller});
  final customPrefixIcon;
  final hintTitle;
  final customSuffixIcon;
  final isDate;
  final isBio;
  final controller;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.stream,
        builder: (context, snapshot) {
          return InkWell(
            onTap: () async {
              if (isDate) {
                DateTime? dateResult = await showDatePicker(
                    context: context,
                    initialDate: authenticationStore.dateTimeController.data ??
                        DateTime(2012),
                    firstDate: DateTime(1960),
                    lastDate: DateTime(2015));
                if (dateResult != null) {
                  authenticationStore.dateTimeController.data = dateResult;
                  controller.data.text = TimeHelper.getDateDDMMYY(dateResult);
                  controller.updateWidget();
                }
              }
            },
            child: TextField(
              onTap: () {},
              controller: controller.data,
              enabled: isDate == true ? false : true,
              cursorColor: Config.activeColor,
              minLines: isBio ? 4 : 1,
              maxLines: isBio ? 4 : 1,
              style: CustomTextStyles.inputTextStyle,
              decoration: InputDecoration(
                hintText: hintTitle,
                hintStyle: CustomTextStyles.hintTextStyle,
                filled: true,
                fillColor: Config.inputBackgroundColor,
                border: CustomTextFieldStyles.defaultBorder,
                enabledBorder: CustomTextFieldStyles.defaultBorder,
                focusedBorder: CustomTextFieldStyles.focusedBorder,
                prefixIcon: customPrefixIcon != null
                    ? Padding(
                        padding: EdgeInsets.all(12.w),
                        child: customImageHelper.getSvgAsset(
                            iconName: customPrefixIcon),
                      )
                    : null,
                suffixIcon: customSuffixIcon != null
                    ? Padding(
                        padding: EdgeInsets.all(12.w),
                        child: customImageHelper.getSvgAsset(
                            iconName: customSuffixIcon),
                      )
                    : null,
              ),
            ),
          );
        });
  }
}
