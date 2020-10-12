import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';

class TasksDetailesCOntroller extends ControllerMVC {
  //to make single instance of class
  factory TasksDetailesCOntroller() {
    if (_this == null) _this = TasksDetailesCOntroller._();
    return _this;
  }
  static TasksDetailesCOntroller _this;

  TasksDetailesCOntroller._();

  static TasksDetailesCOntroller get con => _this;
}
