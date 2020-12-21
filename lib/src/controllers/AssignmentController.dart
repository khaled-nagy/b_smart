import 'dart:async';
import 'dart:convert';
import 'package:b_smart/src/data/models/DepartmentModel.dart';
import 'package:b_smart/src/data/models/LocationModel.dart';
import 'package:b_smart/src/data/models/NewAssinmentChangeModel.dart';
import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/models/PositionModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class AssignmentController extends ControllerMVC {
  //to make single instance of class
  factory AssignmentController() {
    if (_this == null) _this = AssignmentController._();
    return _this;
  }
  static AssignmentController _this;

  AssignmentController._();

  static AssignmentController get con => _this;
  NewassignmentChangeModel newassignmentChangeModel =
      NewassignmentChangeModel();
  static int locationId = 0;
  static int departmentId = 0;
  static int positionId = 0;

  List<LocationModel> locationList = List<LocationModel>();
  List<DepartmentModel> departmentList = List<DepartmentModel>();
  List<PositionModel> positionList = List<PositionModel>();

  Future<NewassignmentChangeModel> newAssignmentChangeData(
      String requestType) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType/new";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);

        return NewassignmentChangeModel.fromJson(jsonValue);
      } else {
        return NewassignmentChangeModel();
      }
    });
  }

  Future getNewRequest(String requestType) async {
    refresh();

    newassignmentChangeModel = await newAssignmentChangeData(requestType);

    refresh();
  }

  Future<List<LocationModel>> getAllLocations(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);

        return (jsonValue as List)
            .map((f) => new LocationModel.fromJson(f))
            .toList();
      } else
        return List<LocationModel>();
    }, onError: (err) {});
  }

  Future<List<DepartmentModel>> getAlldepartments(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);

        return (jsonValue as List)
            .map((f) => new DepartmentModel.fromJson(f))
            .toList();
      } else
        return List<DepartmentModel>();
    }, onError: (err) {});
  }

  Future<List<PositionModel>> getAllPositions(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);

        return (jsonValue as List)
            .map((f) => new PositionModel.fromJson(f))
            .toList();
      } else
        return List<PositionModel>();
    }, onError: (err) {});
  }

  Future getAllLookups(String lookupName) async {
    refresh();
    switch (lookupName) {
      case "locations":
        locationList = await getAllLocations(lookupName);

        break;
      case "departments":
        departmentList = await getAlldepartments(lookupName);

        break;
      case "positions":
        positionList = await getAllPositions(lookupName);

        break;
    }

    refresh();
  }

  Future<bool> postAssignmentChange(
    String requestType,
    int locationId,
    int departmentId,
    int positionId,
  ) async {
    newassignmentChangeModel.newLocationId = locationId;
    newassignmentChangeModel.newDepartmentId = departmentId;
    newassignmentChangeModel.newPositionId = positionId;

    var realbody = jsonEncode(newassignmentChangeModel);
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
