import 'dart:async';
import 'dart:convert';
import 'package:b_smart/src/controllers/NotificationController.dart';
import 'package:b_smart/src/controllers/UserLocalStorage.dart';
import 'package:b_smart/src/screens/HomeScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/services/UserServicess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
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
  bool isLoading = false;

  static final GlobalKey<FormState> loginformKey = GlobalKey<FormState>();

  static bool loginAutoValid = false;
  static final TextEditingController userNameController =
      TextEditingController();
  static final TextEditingController passController = TextEditingController();

  //////////////////////////////////////////////////////////////////////////////////////////
  ///
  static final GlobalKey<FormState> passFormKey = GlobalKey<FormState>();

  static bool passAutoValidate = false;

  static final TextEditingController oldPassController =
      TextEditingController();

  static final TextEditingController emailController = TextEditingController();

  static final TextEditingController confirmPasswordController =
      TextEditingController();

  bool apiCall = false;
  String errorMsg = "";
  bool error = true;
  UserService userService = UserService();

  Future<bool> signInWithEmailAndPassword(
      BuildContext context, String userName, String pass) async {
    // final form = ConstantVarable.loginformKey.currentState;
    // ConstantVarable.loginAutoValid = true;
    // if (form.validate()) {
    //   form.save();

    await userService.signInWithEmailAndPassword(userName, pass).then((user) {
      if (user.accessToken != null) {
        UserLocalStorage().saveClient(user).then((value) {
          if (value == true) {
            UserLocalStorage().saveUserTextField(userName, pass).then((value) {
              if (value == true) {
                NotificationController().getAllNotifications().then((value) {
                  if (value == true) {
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false);
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false);
                  }
                });
              }
            });

            return true;
          } else {
            return false;
          }
        });
      } else {
        Fluttertoast.showToast(
            msg: "You have an error in your username or password",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          isLoading = false;
        });

        // setState(() {
        //   errorMsg = user.error;
        // });
        return false;
      }
    });
    // }
    // refresh();

    return false;
  }

  Future<bool> sendCodeActivation(String email, String otp) async {
    return await http.post("${ConstantVarable.baseUrl}/api/getCodeActivation",
        body: {"email": email, "verified_code": otp},
        headers: {"Accept": "application/json"}).then((response) {
      if (response.statusCode == 200) {
        setState(() {
          // errorMsg = responseJson['MessageEn'];
        });

        return true;
      } else {
        return false;
      }
    });
  }

  Map<String, dynamic> userData = Map();
  getUserProfileData() async {
    String url = "${ConstantVarable.baseUrl}/api/UserProfile";

    await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValu = jsonDecode(response.body);

        setState(() {
          userData = jsonValu;
        });
      } else {}
    }, onError: (error) {});
  }

  Future<bool> changePassword(String oldPass, String newPass) async {
    final form = passFormKey.currentState;
    passAutoValidate = true;
    if (form.validate()) {
      form.save();

      String url = "${ConstantVarable.baseUrl}/api/UserProfile/password";

      return await http.put(url, body: {
        "oldPassword": oldPass,
        "newPassword": newPass
      }, headers: {
        "Authorization": "Bearer ${ConstantVarable.accessToken}",
        "Accept": "application/json",
        // "Content-Type": "application/json"
      }).then((response) {
        if (response.statusCode == 200 || response.statusCode == 400) {
          UserController().clearTextFields();
          return true;
        } else {
          // var jsonValue = jsonDecode(response.body);

          return false;
        }
      });
    }
    refresh();

    return false;
  }

  Future<bool> resetPass(String email, String userName) async {
    return await http.post(
        "${ConstantVarable.baseUrl}/api/UserProfile/password/reset",
        body: {"email": email, "userName": userName},
        headers: {"Accept": "application/json"}).then((response) {
      if (response.statusCode == 200) {
        return true;
      } else {
        final responseJson = json.decode(utf8.decode(response.bodyBytes));

        Fluttertoast.showToast(
            msg: "${responseJson["message"]}",
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

  Future<bool> logOut() async {
    clearTextFields();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    cancelAuthentication();

    return true;
  }

  Future<bool> authenticate() async {
    return await LocalAuthentication().authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true);
  }

  void cancelAuthentication() {
    LocalAuthentication().stopAuthentication();
  }

  Future<bool> checkBiometrics() async {
    return await LocalAuthentication().canCheckBiometrics;
  }

  void clearTextFields() {
    // ConstantVarable.userNameController.text = "";
    // ConstantVarable.emailController.text = "";
    passController.text = "";
    confirmPasswordController.text = "";

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
    else if (val.length < 1) {
      return "الرقم السرى اقل من 2";
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
    else if (val != passController.text) {
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
}
