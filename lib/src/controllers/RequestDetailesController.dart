import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';

class RequestDetailesController extends ControllerMVC {
  //to make single instance of class
  factory RequestDetailesController() {
    if (_this == null) _this = RequestDetailesController._();
    return _this;
  }
  static RequestDetailesController _this;

  RequestDetailesController._();

  static RequestDetailesController get con => _this;
}
