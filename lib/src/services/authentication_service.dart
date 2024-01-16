import 'package:hero_games_assignment/src/helper/api_helper.dart';
import 'package:hero_games_assignment/src/models/response_model.dart';

class AuthenticationService {
  ApiHelper apiHelper = ApiHelper(collectionName: "users");
  registerUser(dynamic data) async {
    try {
      ResponseModel? response = await apiHelper.save(data);
      if (response?.hasError == false) {
        response!.message = "Registration Successful";
      }
      return response;
    } catch (e) {
      return null;
    }
  }
}
