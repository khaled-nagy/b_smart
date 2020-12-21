import 'dart:async';
import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/models/NewPermissionModel.dart';
import 'package:b_smart/src/data/models/PermissionIdModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class PermissionController extends ControllerMVC {
  //to make single instance of class
  factory PermissionController() {
    if (_this == null) _this = PermissionController._();
    return _this;
  }
  static PermissionController _this;

  PermissionController._();

  static PermissionController get con => _this;
  static int permissionTypeId = 0;
  static String permissionStartTime = "00";
  static String permissionEndTime = "00";
  static int permissionDuration = 0;
  static int permissionStartTimeHours = 0;
  static int permissionStartTimeMinuts = 0;
  static int permissionEndTimeHours = 0;
  static int permissionEndTimeMinuts = 0;
  static final TextEditingController permissionNotesController =
      TextEditingController();
  static final TextEditingController permissionDurationController =
      TextEditingController();

  static String permissionDate = "";

  List<PermissionModel> permissionList = List<PermissionModel>();
  NewPermissionModel newPermissionModel = NewPermissionModel();
  Future getAllLookups(String lookupName) async {
    refresh();

    permissionList = await getAllPermissionList(lookupName);

    refresh();
  }

  Future<NewPermissionModel> newPermissionData(String requestType) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType/new";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);

        return NewPermissionModel.fromJson(jsonValue);
      } else {
        // var jsonValue = jsonDecode(response.body);

        return NewPermissionModel();
      }
    });
  }

  Future getNewRequest(String requestType) async {
    refresh();

    newPermissionModel = await newPermissionData(requestType);

    refresh();
  }

  Future<List<PermissionModel>> getAllPermissionList(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);

        return (jsonValue as List)
            .map((f) => new PermissionModel.fromJson(f))
            .toList();
      } else
        return List<PermissionModel>();
    }, onError: (err) {});
  }

  Future<bool> postPermission(
      String requestType,
      int permissionTypeId,
      String permissionDate,
      String duration,
      String startTime,
      String endTime,
      String notes) async {
    newPermissionModel.permissionTypeId = permissionTypeId;
    newPermissionModel.permissionDate = permissionDate;
    newPermissionModel.duration = int.parse(duration);
    newPermissionModel.startTime = startTime;
    newPermissionModel.endTime = endTime;
    newPermissionModel.notes = notes;

    var realbody = jsonEncode(newPermissionModel);
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType";

    return await http.post(url, body: realbody, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        return true;
      } else {
        var jsonValue = jsonDecode(response.body);
        Fluttertoast.showToast(
            msg: "${jsonValue['message']}",
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
}
