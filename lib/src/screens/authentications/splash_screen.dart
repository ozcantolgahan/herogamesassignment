import 'package:flutter/material.dart';
import 'package:hero_games_assignment/src/constants/config.dart';
import 'package:hero_games_assignment/src/helper/api_helper.dart';
import 'package:hero_games_assignment/src/helper/custom_local_storage_helper.dart';
import 'package:hero_games_assignment/src/screens/authentications/register_screen.dart';
import 'package:hero_games_assignment/src/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeFunction(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return HomeScreen();
            } else {
              return RegisterScreen();
            }
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        }));
  }

  Future<bool> initializeFunction() async {
    await customLocalStorageHelper.init();
    //customLocalStorageHelper.deleteToken();
    var token = await customLocalStorageHelper.controlToken();
    if (token != null) {
      Config.token = token;
      return true;
    } else {
      return false;
    }
  }
}
