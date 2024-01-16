import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hero_games_assignment/src/app.dart';
import 'package:hero_games_assignment/src/constants/config.dart';
import 'package:hero_games_assignment/src/helper/custom_notify.dart';
import 'package:hero_games_assignment/src/models/response_model.dart';
import 'package:hero_games_assignment/src/models/user_model.dart';
import 'package:hero_games_assignment/src/services/user_service.dart';
import 'package:hero_games_assignment/src/store/user_store.dart';

final UserController userController = UserController();

class UserController {
  final UserService _userService = UserService();
  getAccount() async {
    try {
      userStore.currentUserLoading.data = true;
      userStore.currentUser.updateWidget();
      ResponseModel? response;
      if (Config.token != null) {
        response = await _userService.getAccount(Config.token!);
      } else {
        response = ResponseModel();
        response?.hasError = true;
        response?.message = "Cannot find user";
      }
      if (response?.hasError == false) {
        userStore.currentUser.data = UserModel(
            fullName: response?.data["fullName"],
            email: response?.data["email"],
            birthdate: response?.data["birthdate"] != null
                ? response?.data["birthdate"].toDate()
                : null,
            biography: response?.data["biography"]);
        userStore.currentUser.updateWidget();
      }
      CustomNotify(
              message: response!.message,
              type: response.hasError == false
                  ? NotifyType.success
                  : NotifyType.error)
          .show(navigatorKey.currentState!.context);

      return response;
    } catch (e) {
    } finally {
      userStore.currentUserLoading.data = false;
      userStore.currentUser.updateWidget();
    }
  }

  updateHobbies({bool isDelete = false, String? title}) async {
    try {
      userStore.currentUserHobbiesUpdateLoading.data = true;
      userStore.currentUserHobbiesUpdateLoading.updateWidget();
      ResponseModel? response;
      if (isDelete) {
        userStore.currentUser.data.hobbies?.remove(title);
      } else {
        if (userStore.newHobbieController.data.text.length > 1) {
          if (userStore.currentUser.data.hobbies == null) {
            userStore.currentUser.data.hobbies = [];
          }
          userStore.currentUser.data.hobbies
              ?.add(userStore.newHobbieController.data.text);
        }
      }
      response = await _userService.updateHobbies(userStore.currentUser.data);
      userStore.newHobbieController.data.clear();
      CustomNotify(
              message: response!.message,
              type: response.hasError == false
                  ? NotifyType.success
                  : NotifyType.error)
          .show(navigatorKey.currentState!.context);
    } catch (e) {
    } finally {
      userStore.currentUserHobbiesUpdateLoading.data = false;
      userStore.currentUserHobbiesUpdateLoading.updateWidget();
    }
  }
}
