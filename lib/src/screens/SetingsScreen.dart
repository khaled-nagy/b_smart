import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/controllers/UserLocalStorage.dart';
import 'package:b_smart/src/data/models/SettingsModel.dart';
import 'package:b_smart/src/widgets/BottomNavigationBar.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/TextFormFieldW.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SetingsScreen extends StatefulWidget {
  createState() => SetingsView();
}

class SetingsView extends StateMVC<SetingsScreen> {
  SetingsView() : super(UserController()) {
    _userController = UserController.con;
  }
  UserController _userController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationbar(),
      backgroundColor: Color(0xffF4F4F4),
      body: SingleChildScrollView(
        child: Form(
          key: UserController.loginformKey,
          autovalidate: UserController.loginAutoValid,
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                height: size.height / 6,
                width: size.width / 3,
                child: Image.asset("assets/imgs/logo.png"),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              TextFormFieldC(
                controller: UserController.userNameController,
                width: size.width * 0.88,
                height: size.height * 0.075,
                labeltext: "_user_name".tr(),
                // validator: (val) => _userController.validateUserName(val),
                obSecureText: false,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              TextFormFieldC(
                controller: UserController.passController,
                width: size.width * 0.88,
                height: size.height * 0.075,
                labeltext: "_pass".tr(),
                // validator: (val) => _userController.validatePassword(val),
                obSecureText: true,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              isLoading == false
                  ? ButtonW(
                      onpress: () {
                        if (UserController.userNameController.text == "") {
                          Fluttertoast.showToast(
                              msg: "Your username is requerd",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (UserController.passController.text == "") {
                          Fluttertoast.showToast(
                              msg: "Your password is requerd",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          setState(() {
                            isLoading = true;
                          });

                          UserController().checkBiometrics().then((value) {
                            if (value == true) {
                              UserController().authenticate().then((value) {
                                if (value == true) {
                                  SettingModel settingModel = SettingModel();
                                  settingModel.userName =
                                      UserController.userNameController.text;
                                  settingModel.pass =
                                      UserController.passController.text;
                                  settingModel.finger = true;

                                  UserLocalStorage()
                                      .saveSettings(settingModel)
                                      .then((value) {
                                    if (value == true) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Your FingerPrent Has Been Added Successflly",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  });
                                }
                              });
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      "This Device Not Support Fingerprint Login",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                isLoading = false;
                              });
                            }
                          });
                        }
                      },
                      height: size.height * 0.065,
                      width: size.width * 0.75,
                      color: Theme.of(context).accentIconTheme.color,
                      text: "Fingerprint",
                      borderradius: BorderRadius.circular(12),
                      textstyle: Theme.of(context).textTheme.headline1,
                    )
                  : CircularProgressIndicator(
                      backgroundColor: Theme.of(context).backgroundColor,
                    ),
              SizedBox(
                height: size.height * 0.04,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
