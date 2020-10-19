import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

class HomePageController extends ControllerMVC {
  //to make single instance of class
  factory HomePageController() {
    if (_this == null) _this = HomePageController._();
    return _this;
  }
  static HomePageController _this;

  HomePageController._();

  static HomePageController get con => _this;

  Future<List<double>> locationData() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();

    return [_locationData.longitude, _locationData.latitude];
  }

  Future<bool> signIn(
      double long, double lat, BuildContext context, String inOrOut) async {
    String urlIn = "${ConstantVarable.baseUrl}/api/attendance/sign-in";
    String urlOt = "${ConstantVarable.baseUrl}/api/attendance/sign-in";
    print(inOrOut == "in" ? urlIn : urlOt);
    return await http.post(inOrOut == "in" ? urlIn : urlOt, body: {
      "longitude": long.toString(),
      "latitude": lat.toString()
    }, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);

        print(jsonValue);

        Fluttertoast.showToast(
            msg: "Attendance has been registered successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Theme.of(context).backgroundColor,
            textColor: Colors.white,
            fontSize: 16.0);

        return true;
      } else {
        var jsonValue = jsonDecode(response.body);

        Fluttertoast.showToast(
            msg: "${jsonValue["message"]}",
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
