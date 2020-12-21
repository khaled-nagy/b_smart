import 'dart:async';
import 'dart:convert';
import 'package:b_smart/src/data/models/NewPayrollAdjustmentModel.dart';
import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/models/PayItemModel.dart';
import 'package:b_smart/src/data/models/YearModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class PayrollController extends ControllerMVC {
  //to make single instance of class
  factory PayrollController() {
    if (_this == null) _this = PayrollController._();
    return _this;
  }
  static PayrollController _this;

  PayrollController._();

  static PayrollController get con => _this;

  static int payItemTypeId = 0;

  static int payStartMonth = 0;
  static int payEndMonth = 0;
  static int payStartYear = 0;
  static int payEndYear = 0;
  static String payStartYearString;
  static String payEndYearString;

  static final TextEditingController payrollValueController =
      TextEditingController();
  static final TextEditingController payrollNotesController =
      TextEditingController();

  List<PayItemModel> payItemList = List<PayItemModel>();

  NewPayrollAdjustmentModel newPayrollAdjustmentModel =
      NewPayrollAdjustmentModel();
  List<YearModel> yearList = List<YearModel>();

  List<YearModel> yearsMethod() {
    int yearNow = DateTime.now().year;
    yearList = [
      YearModel(id: 1, name: "${yearNow - 4}"),
      YearModel(id: 2, name: "${yearNow - 3}"),
      YearModel(id: 3, name: "${yearNow - 2}"),
      YearModel(id: 4, name: "${yearNow - 1}"),
      YearModel(id: 5, name: "$yearNow"),
      YearModel(id: 6, name: "${yearNow + 1}"),
      YearModel(id: 7, name: "${yearNow + 2}"),
      YearModel(id: 8, name: "${yearNow + 3}"),
      YearModel(id: 9, name: "${yearNow + 4}"),
      YearModel(id: 10, name: "${yearNow + 5}"),
    ];

    return yearList;
  }

  Future<List<PayItemModel>> getAllpayitems(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);

        return (jsonValue as List)
            .map((f) => new PayItemModel.fromJson(f))
            .toList();
      } else
        return List<PayItemModel>();
    }, onError: (err) {});
  }

  Future getAllLookups(String lookupName) async {
    refresh();

    payItemList = await getAllpayitems(lookupName);

    refresh();
  }

  Future<NewPayrollAdjustmentModel> newPayrollAdjustmentData(
      String requestType) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType/new";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);

        return NewPayrollAdjustmentModel.fromJson(jsonValue);
      } else {
        return NewPayrollAdjustmentModel();
      }
    });
  }

  Future getNewRequest(String requestType) async {
    refresh();
    switch (requestType) {
      case "payrollAdjustment":
        newPayrollAdjustmentModel = await newPayrollAdjustmentData(requestType);

        break;
    }

    refresh();
  }

  Future<bool> postPayRoll(
    String requestType,
    int payItemId,
    int startMonth,
    int endMonth,
    int startYear,
    int endYear,
    double value,
    String notes,
  ) async {
    newPayrollAdjustmentModel.payItemId = payItemId;
    newPayrollAdjustmentModel.startMonth = startMonth;
    newPayrollAdjustmentModel.endMonth = endMonth;
    newPayrollAdjustmentModel.startYear = startYear;
    newPayrollAdjustmentModel.endYear = endYear;
    newPayrollAdjustmentModel.value = value;
    newPayrollAdjustmentModel.notes = notes;

    var realbody = jsonEncode(newPayrollAdjustmentModel);
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
