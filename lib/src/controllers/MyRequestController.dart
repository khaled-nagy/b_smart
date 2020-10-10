import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';

class MyRequestController extends ControllerMVC {
  //to make single instance of class
  factory MyRequestController() {
    if (_this == null) _this = MyRequestController._();
    return _this;
  }
  static MyRequestController _this;

  MyRequestController._();

  static MyRequestController get con => _this;
}
