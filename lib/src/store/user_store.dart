import 'package:flutter/material.dart';
import 'package:hero_games_assignment/src/bloc/bloc_base.dart';
import 'package:hero_games_assignment/src/models/user_model.dart';

final UserStore userStore = UserStore();

class UserStore {
  Bloc<UserModel> currentUser = Bloc()..data = UserModel();
  Bloc<bool> currentUserLoading = Bloc()..data = false;
  Bloc<TextEditingController> newHobbieController = Bloc()
    ..data = TextEditingController();
  Bloc<bool> currentUserHobbiesUpdateLoading = Bloc()..data = false;
}
