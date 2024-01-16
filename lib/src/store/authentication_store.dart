import 'package:flutter/material.dart';
import 'package:hero_games_assignment/src/bloc/bloc_base.dart';

final AuthenticationStore authenticationStore = AuthenticationStore();

class AuthenticationStore {
  Bloc<TextEditingController> fullNameController = Bloc()
    ..data = TextEditingController();
  Bloc<TextEditingController> emailController = Bloc()
    ..data = TextEditingController();
  Bloc<DateTime?> dateTimeController = Bloc()..data = null;
  Bloc<TextEditingController> bioController = Bloc()
    ..data = TextEditingController();
  Bloc<TextEditingController> dateTextController = Bloc()
    ..data = TextEditingController();
}
