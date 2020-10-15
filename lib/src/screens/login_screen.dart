import 'dart:developer';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/LoginController.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/screens/forgot_password_screen.dart';
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
          // key: ConstantVarable.loginformKey,
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                height: size.height * 0.2,
                width: size.width * 0.4,
                child: Image.asset("assets/imgs/logo.png"),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              TextFormFieldC(
                controller: ConstantVarable.userNameController,
                width: size.width * 0.88,
                height: size.height * 0.075,
                labeltext: "Domain/Username",
                // validator: (val) => _userController.validateUserName(val),
                obSecureText: false,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              TextFormFieldC(
                controller: ConstantVarable.passController,
                width: size.width * 0.88,
                height: size.height * 0.075,
                labeltext: "Password",
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
                  "Language",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              DropDownButton(),
              SizedBox(
                height: size.height * 0.038,
              ),
              isLoading == false
                  ? ButtonW(
                      onpress: () {
                        setState(() {
                          isLoading = true;
                        });
                        _userController
                            .signInWithEmailAndPassword(
                                context,
                                ConstantVarable.userNameController.text,
                                ConstantVarable.passController.text)
                            .then((done) {
                          if (done == true) {
                            setState(() {
                              isLoading = false;
                            });
                            Fluttertoast.showToast(
                                msg: "You have successfully logged in",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            setState(() {
                              isLoading = false;
                            });

                            Fluttertoast.showToast(
                                msg:
                                    "You have an error in your username or password",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        });
                      },
                      height: size.height * 0.065,
                      width: size.width * 0.75,
                      color: Theme.of(context).accentIconTheme.color,
                      text: "Log In",
                      textstyle: Theme.of(context).textTheme.headline1,
                    )
                  : CircularProgressIndicator(
                      backgroundColor: Theme.of(context).backgroundColor,
                    ),
              SizedBox(
                height: size.height * 0.04,
              ),
              InkWell(
                child: Text(
                  "Forget Password?",
                  style: Theme.of(context).textTheme.headline5,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    Scaletransition(screen: ForgotPasswordScreen()),
                  );
                },
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
