import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';

class ProfileController extends ControllerMVC {
  //to make single instance of class
  factory ProfileController() {
    if (_this == null) _this = ProfileController._();
    return _this;
  }
  static ProfileController _this;

  ProfileController._();

  static ProfileController get con => _this;
}
