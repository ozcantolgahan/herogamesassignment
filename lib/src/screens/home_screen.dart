import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/constants/app_constants.dart';
import 'package:hero_games_assignment/src/constants/config.dart';
import 'package:hero_games_assignment/src/controllers/user_controller.dart';
import 'package:hero_games_assignment/src/helper/api_helper.dart';
import 'package:hero_games_assignment/src/store/user_store.dart';
import 'package:hero_games_assignment/src/styles/custom_box_decoration_styles.dart';
import 'package:hero_games_assignment/src/styles/custom_text_styles.dart';
import 'package:hero_games_assignment/src/widgets/custom_add_hobbie_bottom_modal_widget.dart';
import 'package:hero_games_assignment/src/widgets/custom_chip_widget.dart';
import 'package:hero_games_assignment/src/widgets/custom_divider_widget.dart';
import 'package:hero_games_assignment/src/widgets/custom_primary_button_widget.dart';
import 'package:hero_games_assignment/src/widgets/custom_profile_data_widget.dart';
import 'package:hero_games_assignment/src/widgets/custom_text_field_widget.dart';
import 'package:hero_games_assignment/src/widgets/custom_text_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var profileData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => userController.getAccount());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.backgroundColor,
      body: SingleChildScrollView(
        physics: AppConstants.scrollPhysics,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 94.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: CText(
                "Profile",
                style: CustomTextStyles.titleTextStyle,
              ),
            ),
            SizedBox(
              height: 24.w,
            ),
            informationSide(),
            SizedBox(
              height: 32.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: CText(
                "Hobbies",
                style: CustomTextStyles.titleTextStyle,
              ),
            ),
            SizedBox(
              height: 24.w,
            ),
            StreamBuilder(
                stream: userStore.currentUserHobbiesUpdateLoading.stream,
                builder: (context, a) {
                  return Stack(
                    children: [
                      Opacity(
                        opacity: userStore.currentUserHobbiesUpdateLoading.data
                            ? 0.4
                            : 1,
                        child: Container(
                          decoration:
                              CustomBoxDecorationStyles.defaultCardDecoration,
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          width: double.infinity,
                          padding: CustomBoxDecorationStyles.defaultCardPadding,
                          child: userStore.currentUser.data.hobbies != null &&
                                  userStore.currentUser.data.hobbies?.length !=
                                      0
                              ? Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  children: userStore.currentUser.data.hobbies!
                                      .map((e) => CustomChipWidget(
                                            title: e,
                                          ))
                                      .toList(),
                                )
                              : CText(
                                  "Add some hobbies",
                                  style: CustomTextStyles.labelTextStyle,
                                ),
                        ),
                      ),
                      userStore.currentUserHobbiesUpdateLoading.data
                          ? Positioned.fill(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Transform.scale(
                                      scale: 0.8,
                                      child: CircularProgressIndicator())),
                            )
                          : SizedBox()
                    ],
                  );
                }),
            SizedBox(
              height: 32.w,
            ),
            Padding(
              padding:
                  CustomBoxDecorationStyles.defaultCardPaddingOnlyHorizontal,
              child: CustomPrimaryButtonWidget(
                title: "Add Hobbie",
                onTap: () async {
                  await showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) => CustomAddHobbieBottomModalWidget());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget informationSide() {
    return StreamBuilder(
        stream: userStore.currentUserLoading.stream,
        builder: (context, a) {
          return StreamBuilder(
              stream: userStore.currentUser.stream,
              builder: (context, b) {
                profileData = [
                  ["Full Name", userStore.currentUser.data.fullName],
                  ["Email", userStore.currentUser.data.email],
                  ["BirthDate", userStore.currentUser.data.birthdate],
                  ["Biography", userStore.currentUser.data.biography]
                ];
                return Stack(
                  children: [
                    Opacity(
                      opacity: userStore.currentUserLoading.data ? 0.4 : 1,
                      child: Container(
                        decoration:
                            CustomBoxDecorationStyles.defaultCardDecoration,
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        width: double.infinity,
                        padding: CustomBoxDecorationStyles
                            .defaultCardPaddingOnlyHorizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...profileData.map((e) => CustomProfileDataWidget(
                                  profileData: profileData,
                                  e: e,
                                )),
                          ],
                        ),
                      ),
                    ),
                    userStore.currentUserLoading.data
                        ? Positioned.fill(
                            child: Align(
                                alignment: Alignment.center,
                                child: Transform.scale(
                                    scale: 0.8,
                                    child: CircularProgressIndicator())),
                          )
                        : SizedBox()
                  ],
                );
              });
        });
  }
}
