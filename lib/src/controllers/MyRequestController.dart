import 'dart:async';
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

  final getRequestsStream = StreamController.broadcast();
  getRequestsList() async {
    String url = "${ConstantVarable.baseUrl}/api/requests/mine";
    print(url);
    await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonValu = jsonDecode(response.body);
        print(" requests Response is ::::::::: " + jsonValu.toString());
        getRequestsStream.sink.add(jsonValu);
      } else {
        print("error");
      }
    }, onError: (error) {
      getRequestsStream.close();
      print(" requests error is :::: $error");
    });
  }

  final getRequestsDetailsStream = StreamController.broadcast();
  getRequestsDetails(int id, String requestType) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestType/$id";
    print(url);
    await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonValu = jsonDecode(response.body);
        print(" requests Details Response is ::::::::: " + jsonValu.toString());
        getRequestsDetailsStream.sink.add(jsonValu);
      } else {
        print("error");
      }
    }, onError: (error) {
      getRequestsDetailsStream.close();
      print(" requests Details error is :::: $error");
    });
  }
}
