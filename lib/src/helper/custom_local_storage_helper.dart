import 'package:hero_games_assignment/src/constants/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

var customLocalStorageHelper = CustomLocalStorageHelper();

class CustomLocalStorageHelper {
  late SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  controlToken() {
    return _prefs.getString("token");
  }

  saveToken(String token) async {
    Config.token = token;
    return await _prefs.setString("token", token);
  }

  deleteToken() {
    return _prefs.remove("token");
  }
}
