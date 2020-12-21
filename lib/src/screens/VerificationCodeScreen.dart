import 'dart:async';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/Controllers/UserController.dart';
import 'package:b_smart/src/Widgets/SharedWidget.dart';
import 'package:b_smart/src/screens/LoginScreen.dart';
import 'package:b_smart/src/screens/NewPasswordScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class VerificationCodeScreen extends StatefulWidget {
  String forgot_or_register;
  String verificationCode;
  String email;

  bool isVerfiyLocation;
  int userId;
  VerificationCodeScreen(
      {this.verificationCode,
      this.isVerfiyLocation,
      this.forgot_or_register,
      this.email});
  createState() => VerificationCodeView();
}

class VerificationCodeView extends StateMVC<VerificationCodeScreen> {
  VerificationCodeView() : super(UserController()) {
    _userController = UserController.con;
  }
  UserController _userController;

  Timer _timer;
  int counter = 30;
  String codeValue;
  String code;
  bool isLoading = false;
  final Location location = new Location();
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (counter < 1) {
            timer.cancel();
          } else {
            counter = counter - 1;
          }
        },
      ),
    );
  }

  FocusNode adreesDetails = new FocusNode();

  initState() {
    super.initState();
    // location.getLocation();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: Image.asset(
                    "assets/imgs/logo.png",
                    width: MediaQuery.of(context).size.width / 2.6,
                    height: MediaQuery.of(context).size.height / 9,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Text(
                  'مرحبا بك فى قسيمة',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "من فضلك أدخل كود التاكيد الذى تم ارساله على اميلك".tr(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 22,
                ),

                // FlatButton(
                //   child: Text(widget.verificationCode),
                //   onPressed: () {},
                // ),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              "ادخل كود التاكيد",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Directionality(
                                  textDirection: ui.TextDirection.ltr,
                                  child: new VerificationCodeInput(
                                      keyboardType: TextInputType.text,
                                      textStyle:
                                          Theme.of(context).textTheme.headline5,
                                      length: 4,
                                      itemDecoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      onCompleted: (String value) {
                                        if (value.toString() ==
                                            widget.verificationCode
                                                .toString()) {
                                          SharedWidget.alertDialog(
                                              context, "كود تاكيد خطاء");
                                        } else {
                                          SharedWidget.alertDialog(
                                              context, "كود تاكيد صحيح ...");
                                          if (widget.forgot_or_register ==
                                              "forget") {
                                            _userController
                                                .sendCodeActivation(
                                                    widget.email, value)
                                                .then((done) {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                            });
                                          } else {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewPasswordScreen(
                                                            modifyOrNew: "new",
                                                            otp: widget
                                                                .verificationCode)),
                                                (Route<dynamic> route) =>
                                                    false);
                                          }

                                          ConstantVarable.otp = value;
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: Material(
                                    color: Theme.of(context).backgroundColor,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 0.0, bottom: 0.0),
                                        child: Text(
                                          "تاكيد",
                                          style: TextStyle(
                                              color: Colors.grey[50],
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  17),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  if (codeValue == null ||
                                      codeValue.length < 4) {
                                    SharedWidget.alertDialog(context,
                                        "من فضلك أدخل كود التاكيد الصحيح".tr());
                                  }
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 32, left: 16, right: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "لم استلم كود",
                          style: Theme.of(context).textTheme.body1,
                        ),
                        isLoading
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.blue,
                              )
                            : InkWell(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          counter == 0 ? "" : "$counter",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        Container(
                                          width: 4,
                                        ),
                                        counter != 0
                                            ? Text(
                                                "اعادة ارسال",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5,
                                              )
                                            : Text(
                                                "اعادة ارسال",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2,
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // if (counter == 0) {
                                  //   setState(() {
                                  //     isLoading = false;
                                  //   });
                                  //   _userController
                                  //       .sendCodeActivation(
                                  //           widget.email, ConstantVarable.otp)
                                  //       .then((done) {
                                  //     if (done == true) {
                                  //       setState(() {
                                  //         isLoading = false;

                                  //         counter = 30;
                                  //       });
                                  //       startTimer();
                                  //     } else {
                                  //       setState(() {
                                  //         isLoading = false;
                                  //       });
                                  //     }
                                  //   });
                                  // }
                                },
                              ),
                      ],
                    ),
                  ),
                ),

                // showErrorMsg(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
