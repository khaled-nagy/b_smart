import 'dart:async';
import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  List<dynamic> tasksList = List();
  Future<bool> getTasksList(String state) async {
    String url = "${ConstantVarable.baseUrl}/api/inbox/my-tasks?status=$state";

    await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValu = jsonDecode(response.body);
        setState(() {
          tasksList = jsonValu;
        });

        return true;
      } else {
        return false;
      }
    }, onError: (error) {});
    return false;
  }

  Future<bool> approveOrReject(String requestType, int requestId,
      int requestEntryId, String approveOrReject, BuildContext context) async {
    String url =
        "${ConstantVarable.baseUrl}/api/requests/$requestType/$requestId/entries/$requestEntryId/$approveOrReject";

    return await http.post(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        return true;
      } else {
        var jsonValue = jsonDecode(response.body);
        Fluttertoast.showToast(
            msg: jsonValue["message"],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        return false;
      }
    });
  }

  Future<bool> deleteTask(int requestId) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestId";

    return await http.delete(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        return true;
      } else {
        // var jsonValue = jsonDecode(response.body);

        return false;
      }
    });
  }
}
