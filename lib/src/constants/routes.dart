import 'package:flutter/material.dart';
import 'package:hero_games_assignment/src/screens/authentications/register_screen.dart';
import 'package:hero_games_assignment/src/screens/authentications/splash_screen.dart';
import 'package:hero_games_assignment/src/screens/home_screen.dart';

abstract class Routes {
  static MaterialPageRoute materialPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/register":
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case "/home":
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return SplashScreen();
        });
    }
  }
}
