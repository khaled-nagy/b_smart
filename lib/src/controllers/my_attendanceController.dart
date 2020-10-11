import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';

class MyAttendanceController extends ControllerMVC {
  //to make single instance of class
  factory MyAttendanceController() {
    if (_this == null) _this = MyAttendanceController._();
    return _this;
  }
  static MyAttendanceController _this;

  MyAttendanceController._();

  static MyAttendanceController get con => _this;
}