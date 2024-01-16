import 'package:flutter/material.dart';

class AppConstants {
  static get scrollPhysics =>
      ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
