import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/constants/config.dart';
import 'package:hero_games_assignment/src/controllers/user_controller.dart';
import 'package:hero_games_assignment/src/store/user_store.dart';
import 'package:hero_games_assignment/src/styles/custom_text_styles.dart';
import 'package:hero_games_assignment/src/widgets/custom_text_widget.dart';

class CustomChipWidget extends StatelessWidget {
  CustomChipWidget({super.key, this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
          color: Config.inputBackgroundColor,
          border: Border.all(
            color: Config.inputBorderColor,
          ),
          borderRadius: BorderRadius.circular(40.w)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CText(
            title,
            style: CustomTextStyles.inputTextStyle,
          ),
          SizedBox(
            width: 4.w,
          ),
          InkWell(
            onTap: () async {
              await userController.updateHobbies(isDelete: true, title: title);
            },
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
