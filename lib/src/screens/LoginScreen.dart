import 'dart:developer';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/NotificationController.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/controllers/UserLocalStorage.dart';
import 'package:b_smart/src/screens/ForgotPasswordScreen.dart';
import 'package:b_smart/src/screens/HomeScreen.dart';
import 'package:b_smart/src/widgets/BottomNavigationBar.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/Language_Dropdownbtn.dart';
import 'package:b_smart/src/widgets/TextFormFieldW.dart';

import 'package:b_smart/src/widgets/transions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginView();
}

class LoginView extends StateMVC<LoginScreen> {
  LoginView() : super(UserController()) {
    _userController = UserController.con;
  }
  UserController _userController;

  bool isLoadingFinger = false;
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
              Container(
                width: size.width * 0.88,
                height: size.height * 0.045,
                child: Text(
                  "_language".tr(),
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              DropDownButton(),
              SizedBox(
                height: size.height * 0.038,
              ),
              _userController.isLoading == false
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
                            _userController.isLoading = true;
                          });

                          _userController
                              .signInWithEmailAndPassword(
                                  context,
                                  UserController.userNameController.text,
                                  UserController.passController.text)
                              .then((done) {
                            if (done == true) {
                              UserLocalStorage().getUser().then((user) {
                                ConstantVarable.accessToken = user.accessToken;
                                ConstantVarable.userName = user.userName;
                              });
                            } else {}
                          });
                        }
                      },
                      height: size.height * 0.065,
                      width: size.width * 0.75,
                      color: Theme.of(context).accentIconTheme.color,
                      text: "_login".tr(),
                      borderradius: BorderRadius.circular(12),
                      textstyle: Theme.of(context).textTheme.headline1,
                    )
                  : CircularProgressIndicator(
                      backgroundColor: Theme.of(context).backgroundColor,
                    ),
              SizedBox(
                height: size.height * 0.03,
              ),
              // isLoadingFinger == false
              //     ? ButtonW(
              //         onpress: () {
              //           setState(() {
              //             isLoadingFinger = true;
              //           });

              //           UserLocalStorage().getSettings().then((setting) {
              //             if (setting.finger == true) {
              //               UserController().checkBiometrics().then((value) {
              //                 if (value == true) {
              //                   UserController().authenticate().then((value) {
              //                     if (value == true) {
              //                       _userController
              //                           .signInWithEmailAndPassword(context,
              //                               setting.userName, setting.pass)
              //                           .then((done) {
              //                         if (done == true) {
              //                           UserLocalStorage()
              //                               .getUser()
              //                               .then((user) {
              //                             ConstantVarable.accessToken =
              //                                 user.accessToken;
              //                             ConstantVarable.userName =
              //                                 user.userName;
              //                           });
              //                           NotificationController()
              //                               .getAllNotifications()
              //                               .then((value) {
              //                             if (value == true) {
              //                               setState(() {
              //                                 isLoadingFinger = false;
              //                               });
              //                               Navigator.pushAndRemoveUntil(
              //                                   context,
              //                                   MaterialPageRoute(
              //                                       builder: (context) =>
              //                                           HomeScreen()),
              //                                   (Route<dynamic> route) =>
              //                                       false);
              //                             } else {
              //                               setState(() {
              //                                 isLoadingFinger = false;
              //                               });
              //                               Navigator.pushAndRemoveUntil(
              //                                   context,
              //                                   MaterialPageRoute(
              //                                       builder: (context) =>
              //                                           HomeScreen()),
              //                                   (Route<dynamic> route) =>
              //                                       false);
              //                             }
              //                           });
              //                         } else {
              //                           setState(() {
              //                             isLoadingFinger = false;
              //                           });
              //                         }
              //                       });
              //                     }
              //                   });
              //                 } else {
              //                   Fluttertoast.showToast(
              //                       msg:
              //                           "This Device Not Support Fingerprint Login",
              //                       toastLength: Toast.LENGTH_LONG,
              //                       gravity: ToastGravity.CENTER,
              //                       timeInSecForIosWeb: 1,
              //                       backgroundColor: Colors.red,
              //                       textColor: Colors.white,
              //                       fontSize: 16.0);
              //                   setState(() {
              //                     isLoadingFinger = false;
              //                   });
              //                 }
              //               });
              //             } else {
              //               Fluttertoast.showToast(
              //                   msg: "You must set fingerprint login settings",
              //                   toastLength: Toast.LENGTH_LONG,
              //                   gravity: ToastGravity.CENTER,
              //                   timeInSecForIosWeb: 1,
              //                   backgroundColor: Colors.green,
              //                   textColor: Colors.white,
              //                   fontSize: 16.0);
              //               setState(() {
              //                 isLoadingFinger = false;
              //               });
              //             }
              //           });
              //         },
              //         borderradius: BorderRadius.circular(12),
              //         height: size.height * 0.065,
              //         width: size.width * 0.75,
              //         color: Theme.of(context).accentIconTheme.color,
              //         text: "_finger_print_login".tr(),
              //         textstyle: Theme.of(context).textTheme.headline1,
              //       )
              //     : CircularProgressIndicator(
              //         backgroundColor: Theme.of(context).backgroundColor,
              //       ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  child: Text(
                    "_forgot_pass".tr(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      Scaletransition(screen: ForgotPasswordScreen()),
                    );
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget buildSwitchLanguege(
      {BuildContext context, String title, String subtitle, Locale locale}) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Change",
                style: TextStyle(
                    fontSize: 15.0, color: Theme.of(context).accentColor),
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline,
            ),
          ],
        ),
      ),
      onTap: () {
        log(locale.toString(), name: toString());
        EasyLocalization.of(context).locale = locale;
      },
    );
  }
}
