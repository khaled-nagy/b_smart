import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';

class ChangePassController extends ControllerMVC {
  //to make single instance of class
  factory ChangePassController() {
    if (_this == null) _this = ChangePassController._();
    return _this;
  }
  static ChangePassController _this;

  ChangePassController._();

  static ChangePassController get con => _this;
}
