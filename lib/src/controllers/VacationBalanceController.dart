import 'dart:async';
import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/models/NewVacationBalanceModel.dart';
import 'package:b_smart/src/data/models/VacationBalanceIDModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class VacationBalanceController extends ControllerMVC {
  //to make single instance of class
  factory VacationBalanceController() {
    if (_this == null) _this = VacationBalanceController._();
    return _this;
  }
  static VacationBalanceController _this;

  VacationBalanceController._();

  static VacationBalanceController get con => _this;
  NewVacationBalanceModel newVacationBalanceModel = NewVacationBalanceModel();
  List<VacationBalanceModel> vacationBalanceList = List<VacationBalanceModel>();
  static int vacationBalanceTypeId = 0;
  static int vacationBalanceadjustYear = 0;

  static final TextEditingController vacationBalanceadjustNotesVontroller =
      TextEditingController();
  static final TextEditingController vacationBalanceadjustValueVontroller =
      TextEditingController();

  Future<NewVacationBalanceModel> newVacationBalanceData(
      String requestType) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType/new";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);

        return NewVacationBalanceModel.fromJson(jsonValue);
      } else {
        return NewVacationBalanceModel();
      }
    });
  }

  Future<List<VacationBalanceModel>> getAllVacationGroups(
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
            .map((f) => new VacationBalanceModel.fromJson(f))
            .toList();
      } else
        return List<VacationBalanceModel>();
    }, onError: (err) {});
  }

  Future getAllLookups(String lookupName) async {
    refresh();

    vacationBalanceList = await getAllVacationGroups(lookupName);

    refresh();
  }

  Future getNewRequest(String requestType) async {
    refresh();

    newVacationBalanceModel = await newVacationBalanceData(requestType);

    refresh();
  }

  Future<bool> postVacationBalance(
    String requestType,
    int balanceId,
    int year,
    double value,
    String notes,
  ) async {
    newVacationBalanceModel.vacationTypeId = balanceId;
    newVacationBalanceModel.year = year;
    newVacationBalanceModel.value = value;
    newVacationBalanceModel.notes = notes;

    var realbody = jsonEncode(newVacationBalanceModel);
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
