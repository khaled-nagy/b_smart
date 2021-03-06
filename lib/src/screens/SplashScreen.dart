import 'dart:async';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/controllers/UserLocalStorage.dart';
import 'package:b_smart/src/screens/HomeScreen.dart';
import 'package:b_smart/src/screens/LoginScreen.dart';
import 'package:b_smart/src/widgets/transions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      UserLocalStorage().getUserTextField().then((userData) {
        print(userData);
        UserController.userNameController.text = userData['username'];
        UserLocalStorage().getUser().then((user) {
          if (userData['username'] == null || userData['pass'] == null) {
            Navigator.pushReplacement(
                context, Scaletransition(screen: LoginScreen()));
          } else {
            ConstantVarable.accessToken = user.accessToken;
            ConstantVarable.userName = user.userName;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.25,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage("assets/imgs/logo.png")),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              SpinKitWave(
                itemCount: 20,
                type: SpinKitWaveType.center,
                duration: Duration(seconds: 3),
                size: 100.0,
                itemBuilder: (context, index) {
                  return DecoratedBox(
                      decoration: BoxDecoration(
                    color: index.isEven
                        ? Theme.of(context).backgroundColor
                        : Colors.black,
                  ));
                },
              )
            ],
          ),
        ),
        backgroundColor: Colors.white);

    //   image: AssetImage("assets/imgs/logo.png"),
  }
}
