import 'dart:async';
import 'dart:convert';
import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/models/NewTerminationModel.dart';
import 'package:b_smart/src/data/models/TerminasionModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class TerminationController extends ControllerMVC {
  //to make single instance of class
  factory TerminationController() {
    if (_this == null) _this = TerminationController._();
    return _this;
  }
  static TerminationController _this;

  TerminationController._();

  static TerminationController get con => _this;

  static int terminationTypeId = 0;
  static String terminasionLastWorkinDayCalender = "";
  static final TextEditingController terminasionNotescontroller =
      TextEditingController();
  NewTerminationModel newTerminationModel = NewTerminationModel();
  List<TerminasionModel> terminationList = List<TerminasionModel>();
  Future<NewTerminationModel> newTerminationData(String requestType) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType/new";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);

        return NewTerminationModel.fromJson(jsonValue);
      } else {
        // var jsonValue = jsonDecode(response.body);

        return NewTerminationModel();
      }
    });
  }

  Future<List<TerminasionModel>> getAllTerminasionList(
      String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);

        return (jsonValue as List)
            .map((f) => new TerminasionModel.fromJson(f))
            .toList();
      } else
        return List<TerminasionModel>();
    }, onError: (err) {});
  }

  Future getAllLookups(String lookupName) async {
    refresh();

    terminationList = await getAllTerminasionList(lookupName);

    refresh();
  }

  Future getNewRequest(String requestType) async {
    refresh();

    newTerminationModel = await newTerminationData(requestType);

    refresh();
  }

  Future<bool> postTermination(
    String requestType,
    int treminationId,
    String lastDay,
    String notes,
  ) async {
    newTerminationModel.terminationTypeId = treminationId;
    newTerminationModel.lastWorkingDay = lastDay;
    newTerminationModel.notes = notes;

    var realbody = jsonEncode(newTerminationModel);
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
