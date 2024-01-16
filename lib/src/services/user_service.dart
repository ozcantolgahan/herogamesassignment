import 'package:hero_games_assignment/src/helper/api_helper.dart';
import 'package:hero_games_assignment/src/models/response_model.dart';

class UserService {
  ApiHelper apiHelper = ApiHelper(collectionName: "users");
  getAccount(String email) async {
    try {
      ResponseModel? response = await apiHelper.read("email", email);
      if (response?.hasError == false) {
        response!.message = "Welcome";
      }
      return response;
    } catch (e) {
      return null;
    }
  }

  updateHobbies(dynamic data) async {
    try {
      ResponseModel? response = await apiHelper.update("hobbies", data);
      if (response?.hasError == false) {
        response!.message = "Hobbies updated successfuly";
      }
      return response;
    } catch (e) {
      return null;
    }
  }
}
