import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';

class MyTasksController extends ControllerMVC {
  //to make single instance of class
  factory MyTasksController() {
    if (_this == null) _this = MyTasksController._();
    return _this;
  }
  static MyTasksController _this;

  MyTasksController._();

  static MyTasksController get con => _this;
}
