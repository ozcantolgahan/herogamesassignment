import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hero_games_assignment/src/app.dart';
import 'package:hero_games_assignment/src/controllers/user_controller.dart';
import 'package:hero_games_assignment/src/helper/api_helper.dart';
import 'package:hero_games_assignment/src/helper/custom_local_storage_helper.dart';
import 'package:hero_games_assignment/src/helper/custom_notify.dart';
import 'package:hero_games_assignment/src/models/response_model.dart';
import 'package:hero_games_assignment/src/models/user_model.dart';
import 'package:hero_games_assignment/src/services/authentication_service.dart';
import 'package:hero_games_assignment/src/store/authentication_store.dart';

final AuthenticationController authenticationController =
    AuthenticationController();

class AuthenticationController {
  final AuthenticationService _authenticationService = AuthenticationService();
  registerUser() async {
    try {
      ResponseModel? response;
      if (await isDuplicateUniqueName(
          authenticationStore.emailController.data.text)) {
        response = ResponseModel();
        response.hasError = true;
        response.message = "This email has been used before";
      } else if ((!authenticationStore.emailController.data.text
              .contains("@")) ||
          authenticationStore.emailController.data.text.length < 3) {
        response = ResponseModel();
        response.hasError = true;
        response.message = "Email is wrong";
      } else {
        response = await _authenticationService.registerUser(UserModel(
            fullName: authenticationStore.fullNameController.data.text,
            email: authenticationStore.emailController.data.text,
            birthdate: authenticationStore.dateTimeController.data,
            biography: authenticationStore.bioController.data.text));
      }

      CustomNotify(
              message: response!.message,
              type: response.hasError == false
                  ? NotifyType.success
                  : NotifyType.error)
          .show(navigatorKey.currentState!.context);
      if (response?.hasError == false) {
        await customLocalStorageHelper
            .saveToken(authenticationStore.emailController.data.text);
        disposeAllRegisterControllers();
      }
      return response;
    } catch (e) {}
  }

  disposeAllRegisterControllers() {
    authenticationStore.fullNameController.dispose();
    authenticationStore.emailController.dispose();
    authenticationStore.dateTimeController.dispose();
    authenticationStore.bioController.dispose();
    authenticationStore.dateTextController.dispose();
  }

  Future<bool> isDuplicateUniqueName(String uniqueName) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: uniqueName)
        .get();
    return query.docs.isNotEmpty;
  }
}
