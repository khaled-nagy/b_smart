import 'dart:async';

import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/screens/LoginScreen.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/TextFormFieldW%20copy.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgotPasswordScreen extends StatefulWidget {
  createState() => ForgotPasswordView();
}

class ForgotPasswordView extends StateMVC<ForgotPasswordScreen> {
  ForgotPasswordView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50, top: 25),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage("assets/imgs/logo.png"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "_forgot_message".tr(),
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Form(
                            // key: ConstantVarable.loginformKey,
                            // autovalidate: ConstantVarable.loginAutoValid,
                            child: Column(
                              children: <Widget>[
                                TextFormFieldW(
                                  textInputType: TextInputType.emailAddress,
                                  controller: UserController.emailController,
                                  validator: (val) =>
                                      _userController.validateEmail(val),
                                  image: "assets/imgs/001-mail@3x.png",
                                  hintText: "_email".tr(),
                                  obSecureText: false,
                                ),
                                TextFormFieldW(
                                  textInputType: TextInputType.emailAddress,
                                  controller: UserController.userNameController,
                                  validator: (val) =>
                                      _userController.validateEmail(val),
                                  image: "assets/imgs/attendance.png",
                                  hintText: "_user_name".tr(),
                                  obSecureText: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 16,
                      ),
                      isLoading == false
                          ? ButtonW(
                              borderradius: BorderRadius.circular(12),
                              onpress: () {
                                setState(() {
                                  isLoading = true;
                                });
                                _userController
                                    .resetPass(
                                        UserController.emailController.text,
                                        UserController.userNameController.text)
                                    .then((value) {
                                  if (value == true) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pop(context);
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                });
                              },
                              height: size.height * 0.065,
                              width: size.width * 0.75,
                              color: Theme.of(context).accentIconTheme.color,
                              text: "Reset",
                              textstyle: Theme.of(context).textTheme.headline1,
                            )
                          : CircularProgressIndicator(
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                            ),
                      Container(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogResetPassword(BuildContext context) async {
    // check if 0 skill , 1 history , 2 education
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          content: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    "assets/imgs/res_photo.PNG",
                    width: 100,
                    height: 100,
                  ),
                  Text("_reset_message".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[800], fontSize: 15)),
                  Text(
                    "تسلم",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: InkWell(
                      child: new Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: new Material(
                            color: Color(0xffE5345D),
                            elevation: 0.0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                side: BorderSide(
                                    color: Colors.white, width: 2.0)),
                            child: new Center(
                                child: new Padding(
                                    padding: new EdgeInsets.only(
                                        top: 8.0, bottom: 8.0),
                                    child: new Text(
                                      "_done".tr(),
                                      style: new TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    )))),
                      ),
                      onTap: () {
                        // Navigator.pop(context);

                        // Navigator.pushReplacement(context, MaterialPageRoute(
                        //   builder: (BuildContext context)=> LoginScreen()
                        // ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          ],
        );
      },
    );
  }
}
