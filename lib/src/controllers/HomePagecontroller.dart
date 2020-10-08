import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';

class HomePageController extends ControllerMVC {
  //to make single instance of class
  factory HomePageController() {
    if (_this == null) _this = HomePageController._();
    return _this;
  }
  static HomePageController _this;

  HomePageController._();

  static HomePageController get con => _this;
}
