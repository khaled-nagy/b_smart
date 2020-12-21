import 'dart:async';
import 'dart:convert';
import 'package:b_smart/ConstantVarables.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class MyAttendanceController extends ControllerMVC {
  //to make single instance of class
  factory MyAttendanceController() {
    if (_this == null) _this = MyAttendanceController._();
    return _this;
  }
  static MyAttendanceController _this;

  MyAttendanceController._();

  static MyAttendanceController get con => _this;

  static String attendanceCalender = "";
  List<dynamic> attendanceList = List();

  Future<bool> getAttendanceList() async {
    String date = attendanceCalender == ""
        ? DateTime.now().toString().substring(0, 10)
        : attendanceCalender;
    String url = "${ConstantVarable.baseUrl}/api/attendance/mine/$date";

    await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValu = jsonDecode(response.body);

        setState(() {
          attendanceList = jsonValu;
        });

        return true;
      } else {
        attendanceList = [];
        return false;
      }
    }, onError: (error) {});
    return false;
  }
}
