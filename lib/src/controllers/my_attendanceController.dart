import 'package:b_smart/src/data/models/MonthModel.dart';
import 'package:b_smart/src/data/models/YearModel.dart';
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
  List<MonthModel> monthlist = [
    MonthModel(id: "1", name: "January"),
    MonthModel(id: "2", name: "February"),
    MonthModel(id: "3", name: "March"),
    MonthModel(id: "4", name: "April"),
    MonthModel(id: "5", name: "May"),
    MonthModel(id: "6", name: "June"),
    MonthModel(id: "7", name: "July"),
    MonthModel(id: "8", name: "August"),
    MonthModel(id: "9", name: "Septemper"),
    MonthModel(id: "10", name: "October"),
    MonthModel(id: "11", name: "November"),
    MonthModel(id: "12", name: "December"),
  ];
  List<YearModel> yearList = [
    YearModel(id: "1", name: "2010"),
    YearModel(id: "2", name: "2011"),
    YearModel(id: "3", name: "2012"),
    YearModel(id: "4", name: "2013"),
    YearModel(id: "5", name: "2014"),
    YearModel(id: "6", name: "2015"),
    YearModel(id: "7", name: "2016"),
    YearModel(id: "8", name: "2017"),
    YearModel(id: "9", name: "2018"),
    YearModel(id: "10", name: "2019"),
    YearModel(id: "11", name: "2020"),
    YearModel(id: "12", name: "2021"),
  ];
}
