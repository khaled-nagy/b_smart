import 'dart:async';
import 'dart:convert';
import 'package:b_smart/src/data/models/LoanModel.dart';
import 'package:b_smart/src/data/models/NewLoanModel.dart';
import 'package:b_smart/ConstantVarables.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class LoanController extends ControllerMVC {
  //to make single instance of class
  factory LoanController() {
    if (_this == null) _this = LoanController._();
    return _this;
  }
  static LoanController _this;

  LoanController._();

  static LoanController get con => _this;

  static int loanTypeId = 0;
  static int loanStartMonth = 0;
  static int loanEndMonth = 0;
  static int loanStartYear = 0;
  static int loanEndYear = 0;
  static final TextEditingController loanValuecontroller =
      TextEditingController();
  static final TextEditingController loanInstallmentCountcontroller =
      TextEditingController();
  static final TextEditingController loanInstallmentValuecontroller =
      TextEditingController();

  List<LoanModel> loanList = List<LoanModel>();
  NewLoanModel newLoanModel = NewLoanModel();

  Future<List<LoanModel>> getAllLoanList(String lookupName) async {
    String url = "${ConstantVarable.baseUrl}/api/lookups/$lookupName";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);

        return (jsonValue as List)
            .map((f) => new LoanModel.fromJson(f))
            .toList();
      } else
        return List<LoanModel>();
    }, onError: (err) {});
  }

  Future<NewLoanModel> newLoanData(String requestType) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType/new";

    return await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);

        return NewLoanModel.fromJson(jsonValue);
      } else {
        return NewLoanModel();
      }
    });
  }

  Future getAllLookups(String lookupName) async {
    refresh();

    loanList = await getAllLoanList(lookupName);

    refresh();
  }

  Future getNewRequest(String requestType) async {
    refresh();

    newLoanModel = await newLoanData(requestType);

    refresh();
  }

  Future<bool> postLoan(
      String requestType,
      int loanTypeId,
      double value,
      int installmentsCount,
      double installmentValue,
      int startMonth,
      int endMonth,
      int startYear,
      int endYear) async {
    newLoanModel.loanTypeId = loanTypeId;
    newLoanModel.value = value;
    newLoanModel.installmentsCount = installmentsCount;
    newLoanModel.installmentValue = installmentValue;
    newLoanModel.startMonth = startMonth;
    newLoanModel.endMonth = endMonth;
    newLoanModel.startYear = startYear;
    newLoanModel.endYear = endYear;

    var realbody = jsonEncode(newLoanModel);
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
