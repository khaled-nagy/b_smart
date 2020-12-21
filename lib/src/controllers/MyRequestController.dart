import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class MyRequestController extends ControllerMVC {
  //to make single instance of class
  factory MyRequestController() {
    if (_this == null) _this = MyRequestController._();
    return _this;
  }
  static MyRequestController _this;

  MyRequestController._();

  static MyRequestController get con => _this;
  List<dynamic> requestsList = List();
  Map<String, dynamic> requestDetails = Map();
  List<dynamic> requestStatus = List();

  Future<bool> getRequestsList() async {
    String url = "${ConstantVarable.baseUrl}/api/requests/mine";

    await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValu = jsonDecode(response.body);

        setState(() {
          requestsList = jsonValu;
        });
        return true;
      } else {
        return false;
      }
    }, onError: (error) {});
    return false;
  }

  Future<bool> getRequestsDetails(int id, String requestType) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType/$id";

    await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValu = jsonDecode(response.body);

        setState(() {
          requestDetails = jsonValu;
          requestStatus = jsonValu["states"];
        });
        return true;
      } else {
        return false;
      }
    }, onError: (error) {});
    return false;
  }
}
