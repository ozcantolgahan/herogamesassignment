import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/constants/config.dart';
import 'package:hero_games_assignment/src/helper/time_helper.dart';
import 'package:hero_games_assignment/src/styles/custom_text_styles.dart';
import 'package:hero_games_assignment/src/widgets/custom_text_widget.dart';

class CustomProfileDataWidget extends StatelessWidget {
  CustomProfileDataWidget({super.key, this.profileData, this.e});
  var profileData;
  var e;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      decoration: BoxDecoration(
          border: profileData.last == e
              ? null
              : Border(bottom: BorderSide(color: Config.inputBackgroundColor))),
      child: profileData.last == e
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  e[0],
                  style: CustomTextStyles.labelTextStyle,
                ),
                SizedBox(
                  height: 16.w,
                ),
                CText(
                  e[1] ?? "",
                  style: CustomTextStyles.primaryTextStyle,
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CText(
                  e[0],
                  style: CustomTextStyles.labelTextStyle,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: CText(
                    e[1] is DateTime
                        ? TimeHelper.getDateDDMMYY(e[1])
                        : e[1] ?? "",
                    style: CustomTextStyles.primaryTextStyle,
                    align: TextAlign.end,
                  ),
                )
              ],
            ),
    );
  }
}
