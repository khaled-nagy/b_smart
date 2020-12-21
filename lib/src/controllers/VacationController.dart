import 'dart:async';
import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/models/NewVacationModel.dart';
import 'package:b_smart/src/data/models/VacationModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class VacationController extends ControllerMVC {
  //to make single instance of class
  factory VacationController() {
    if (_this == null) _this = VacationController._();
    return _this;
  }
  static VacationController _this;

  VacationController._();

  static VacationController get con => _this;

  static final TextEditingController vacationNotesController =
      TextEditingController();
  static final TextEditingController vacationNumberController =
      TextEditingController();
  static final TextEditingController vacationEndCalenderController =
      TextEditingController();
  static DateTime vacationStartCalender = DateTime.now();
  static DateTime vacationEndCalender = DateTime.now();
  static String returnDate = "";

  static int vacationStartDay = DateTime.now().day;
  static int vacationStartMonth = 0;
  static int vacationStartYear = 0;
  static int vacationEndDay = 0;
  static int vacationEndMonth = 0;
  static int vacationEndYear = 0;
  static int vacationTypeId = 0;

  NewVacationModel newVacationModel = NewVacationModel();
  List<VacationModel> vacationList = List<VacationModel>();
  Future<NewVacationModel> newVacationData(String requestType) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType/new";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);

        return NewVacationModel.fromJson(jsonValue);
      } else {
        // var jsonValue = jsonDecode(response.body);

        return NewVacationModel();
      }
    });
  }

  Future<List<VacationModel>> getAllVacationList(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);

        return (jsonValue as List)
            .map((f) => new VacationModel.fromJson(f))
            .toList();
      } else
        return List<VacationModel>();
    }, onError: (err) {});
  }

  Future<bool> postVacation(
      String requestType,
      int vacationTypeId,
      String numberOfDays,
      String startDate,
      String endDate,
      String returnDate,
      String notes) async {
    newVacationModel.vacationTypeId = vacationTypeId;
    newVacationModel.numberOfDays = double.parse(numberOfDays);
    newVacationModel.startDate = startDate;
    newVacationModel.endDate = endDate;
    newVacationModel.returnDate = returnDate;
    newVacationModel.notes = notes;

    var realbody = jsonEncode(newVacationModel);
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType";

    return await http.post(url, body: realbody, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      "Content-Type": "application/json"
    }).then((response) {
      print(response.body);
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
    }, onError: (e) {});
  }

  Future<String> returnDateRequest(int employeeId, int vacationTypeId,
      String startDate, String endDate, String numberOfDays) async {
    String url = "${ConstantVarable.baseUrl}/vacation-requests/return-date";

    return await http.post(url, body: {
      "employeeId": employeeId.toString(),
      "vacationTypeId": vacationTypeId.toString(),
      "startDate": startDate,
      "endDate": endDate,
      "numberOfDays": numberOfDays,
    }, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);

        return jsonValue;
      } else {
        return "";
      }
    });
  }

  Future getNewRequest(String requestType) async {
    refresh();

    newVacationModel = await newVacationData(requestType);

    refresh();
  }

  Future getAllLookups(String lookupName) async {
    refresh();

    vacationList = await getAllVacationList(lookupName);

    refresh();
  }
}
