import 'dart:async';
import 'dart:convert';
import 'package:b_smart/src/data/models/MonthModel.dart';
import 'package:b_smart/src/data/models/ContactResonModel.dart';
import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/services/UserServicess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserController extends ControllerMVC {
  //to make single instance of class
  factory UserController() {
    if (_this == null) _this = UserController._();
    return _this;
  }
  static UserController _this;

  UserController._();

  static UserController get con => _this;

  bool apiCall = false;
  String errorMsg = "";
  bool error = true;
  UserService userService = UserService();
  List<ContactResonModel> resonContactList = [
    ContactResonModel(id: "1", name: "الانضمام كمشهور"),
    ContactResonModel(id: "2", name: "الانضمام كشركة"),
    ContactResonModel(id: "3", name: " مشكلة تتعلق بقسيمتى"),
    ContactResonModel(id: "4", name: "اخرى")
  ];
  List<MonthModel> monthlist = [
    MonthModel(id: "1", name: "تبوك"),
    MonthModel(id: "2", name: "الرياض"),
    MonthModel(id: "3", name: "جدة"),
  ];

  Future<bool> signInWithEmailAndPassword(
      BuildContext context, String userName, String pass) async {
    // final form = ConstantVarable.loginformKey.currentState;
    // ConstantVarable.loginAutoValid = true;
    // if (form.validate()) {
    //   form.save();

    await userService
        .signInWithEmailAndPassword(userName, pass)
        .then((loginMap) {
      if (loginMap.isNotEmpty) {
        print("login map is :" + loginMap.toString());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false);

        return true;
      } else {
        print("login map is :" + loginMap.toString());
        print("error");
        // setState(() {
        //   errorMsg = user.error;
        // });
        return false;
      }
    });
    // }
    // refresh();

    // return false;
  }

  Future<bool> sendCodeActivation(String email, String otp) async {
    return await http.post("${ConstantVarable.baseUrl}/api/getCodeActivation",
        body: {"email": email, "verified_code": otp},
        headers: {"Accept": "application/json"}).then((response) {
      if (response.statusCode == 200) {
        final responseJson = json.decode(utf8.decode(response.bodyBytes));
        print("respnse json $responseJson");
        setState(() {
          // errorMsg = responseJson['MessageEn'];
        });
        print(" true  ");
        return true;
      } else {
        print(" false  ");
        return false;
      }
    });
  }

  Future<bool> updateProfile(BuildContext context, String fName, String lName,
      String email, String phone, String cityId) async {
    await userService
        .updateUser(fName, lName, email, phone, cityId)
        .then((done) {
      print(done);
      if (done == true) {
        Fluttertoast.showToast(
            msg: "تم تحديث بياناتك بنجاح",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        print("true");
        return true;
      } else {
        // errorMsg = user.error;

        print("false $errorMsg");
        print("false");
        setState(() {});
        return false;
      }
    });

    refresh();

    return false;
  }

  Future<bool> logOut() async {
    clearTextFields();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    return true;
  }

  void clearTextFields() {
    ConstantVarable.fNameController.text = "";
    ConstantVarable.lNameController.text = "";
    ConstantVarable.userNameController.text = "";
    ConstantVarable.emailController.text = "";
    ConstantVarable.passController.text = "";
    ConstantVarable.confirmPasswordController.text = "";
    ConstantVarable.phoneController.text = "";

    setState(() {
      errorMsg = "";
    });
  }

  Widget showErrorMsg() {
    return Text(
      errorMsg == ""
          ? ConstantVarable.loginError == null
              ? ""
              : ConstantVarable.loginError
          : errorMsg,
      style: new TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  String validateUserName(String val) {
    if (val.trim().isEmpty) {
      return "من فضلك ادخل البيانات";
    } else
      return null;
  }

  String validatePhone(String val) {
    if (val.trim().isEmpty) {
      return "من فضلك ادخل رقم الهاتف";
    } else
      return null;
  }

  String validateEmail(String val) {
    if (val.isEmpty)
      return "ادخل البريد الالكترونى";
    else {
      final _emailRegExpString = r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
          r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
      if (!RegExp(_emailRegExpString, caseSensitive: false).hasMatch(val)) {
        return "البريد الاكترونى غير صالح";
      } else
        return null;
    }
  }

  String validatePassword(String val) {
    if (val.trim().isEmpty)
      return "من فضلك ادخل الرقم السرى";
    else if (val.length < 8) {
      return "الرقم السرى اقل من 8";
    } else
      return null;
  }

  String validateStudentCode(String val) {
    if (val.trim().isEmpty)
      return "من فضلك ادخل كود الطالب";
    else
      return null;
  }

  String validateConfirmPassword(String val) {
    if (val.trim().isEmpty)
      return "من فضلك ادخل الرقم السرى";
    else if (val != ConstantVarable.passController.text) {
      return "الرقم السرى غير مطابق";
    } else
      return null;
  }

  String validateAnyFeild(BuildContext context, String val) {
    if (val.trim().isEmpty) {
      if (EasyLocalization.of(context).locale == Locale('ar')) {
        return "من فضلك لا تترك الحقل فارغا";
      } else {
        return "Please do not leave the field blank";
      }
    } else
      return null;
  }

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

    return [_locationData.latitude, _locationData.longitude];
  }
}
