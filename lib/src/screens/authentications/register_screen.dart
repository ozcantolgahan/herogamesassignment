import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_games_assignment/src/constants/app_constants.dart';
import 'package:hero_games_assignment/src/constants/config.dart';
import 'package:hero_games_assignment/src/controllers/authentication_controller.dart';
import 'package:hero_games_assignment/src/helper/custom_image_helper.dart';
import 'package:hero_games_assignment/src/models/response_model.dart';
import 'package:hero_games_assignment/src/store/authentication_store.dart';
import 'package:hero_games_assignment/src/styles/custom_box_decoration_styles.dart';
import 'package:hero_games_assignment/src/styles/custom_text_styles.dart';
import 'package:hero_games_assignment/src/widgets/custom_primary_button_widget.dart';
import 'package:hero_games_assignment/src/widgets/custom_text_field_widget.dart';
import 'package:hero_games_assignment/src/widgets/custom_text_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var registerDataList = [
    ["Ad Soyad", "user", authenticationStore.fullNameController],
    ["Eposta", "mail", authenticationStore.emailController],
    ["Doğum Tarihi", "birth", authenticationStore.dateTextController],
    ["Biyografi", null, authenticationStore.bioController],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Config.backgroundColor,
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            width: double.infinity,
            padding: CustomBoxDecorationStyles.defaultCardPadding,
            decoration: CustomBoxDecorationStyles.defaultCardDecoration,
            child: SingleChildScrollView(
              physics: AppConstants.scrollPhysics,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CText(
                    "Register",
                    style: CustomTextStyles.titleTextStyle,
                  ),
                  SizedBox(
                    height: 45.w,
                  ),
                  ...registerDataList.map(
                    (e) => Padding(
                      padding: EdgeInsets.only(bottom: 24.w),
                      child: CustomTextFieldWidget(
                        hintTitle: e[0],
                        customPrefixIcon: e[1],
                        customSuffixIcon: e[1] == "birth" ? "arrow_down" : null,
                        isDate: e[1] == "birth",
                        isBio: e[1] == null,
                        controller: e[2],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.w,
                  ),
                  CustomPrimaryButtonWidget(
                    onTap: () async {
                      ResponseModel? response =
                          await authenticationController.registerUser();
                      if (response?.hasError == false) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/home", (route) => false);
                      }
                    },
                    title: "Register",
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
