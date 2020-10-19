import 'dart:async';
import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class MyTasksController extends ControllerMVC {
  //to make single instance of class
  factory MyTasksController() {
    if (_this == null) _this = MyTasksController._();
    return _this;
  }
  static MyTasksController _this;

  MyTasksController._();

  static MyTasksController get con => _this;

  final getTasksStream = StreamController.broadcast();
  Future<bool> getTasksList(String state) async {
    String url = "${ConstantVarable.baseUrl}/api/inbox/my-tasks?status=$state";
    print(url);
    await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonValu = jsonDecode(response.body);
        print(" Tasks Response is ::::::::: " + jsonValu.toString());
        getTasksStream.sink.add(jsonValu);
        return true;
      } else {
        print("error");
        return false;
      }
    }, onError: (error) {
      getTasksStream.close();
      print(" Tasks error is :::: $error");
    });
    return false;
  }
}
