import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/constants/config.dart';
import 'package:hero_games_assignment/src/controllers/user_controller.dart';
import 'package:hero_games_assignment/src/store/user_store.dart';
import 'package:hero_games_assignment/src/styles/custom_box_decoration_styles.dart';
import 'package:hero_games_assignment/src/styles/custom_text_styles.dart';
import 'package:hero_games_assignment/src/widgets/custom_primary_button_widget.dart';
import 'package:hero_games_assignment/src/widgets/custom_text_field_widget.dart';
import 'package:hero_games_assignment/src/widgets/custom_text_widget.dart';

class CustomAddHobbieBottomModalWidget extends StatelessWidget {
  const CustomAddHobbieBottomModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomBoxDecorationStyles.defaultCardPadding,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Config.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.w), topRight: Radius.circular(12.w))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0,
                child: InkWell(
                  onTap: () {},
                  child: Icon(Icons.close),
                ),
              ),
              CText(
                "New Hobbie",
                style: CustomTextStyles.titleTextStyle,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  userStore.newHobbieController.data.clear();
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 32.w,
          ),
          CustomTextFieldWidget(
            controller: userStore.newHobbieController,
            hintTitle: "Write something...",
            isBio: false,
          ),
          SizedBox(
            height: 32.w,
          ),
          CustomPrimaryButtonWidget(
            title: "Save",
            onTap: () async {
              Navigator.pop(context);
              await userController.updateHobbies();
            },
          ),
          SizedBox(
            height: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
                ? 350.w
                : 0,
          )
        ],
      ),
    );
  }
}
