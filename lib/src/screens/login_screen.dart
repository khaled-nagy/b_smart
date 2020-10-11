import 'package:b_smart/src/controllers/LoginController.dart';
import 'package:b_smart/src/widgets/BottomNavigationBar.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/Language_Dropdownbtn.dart';
import 'package:b_smart/src/widgets/TextFormFieldW.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginView();
}

class LoginView extends StateMVC<LoginScreen> {
  LoginView() : super(LoginController()) {
    _loginController = LoginController.con;
  }
  LoginController _loginController;
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
                width: size.width * 0.88,
                height: size.height * 0.075,
                labeltext: "Domain/Username",
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              TextFormFieldC(
                width: size.width * 0.88,
                height: size.height * 0.075,
                labeltext: "Password",
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
              ButtonW(
                onpress: () {
                  _loginController.loginButton(context);
                },
                height: size.height * 0.065,
                width: size.width * 0.75,
                color: Theme.of(context).accentIconTheme.color,
                text: "Log In",
                textstyle: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              InkWell(
                child: Text(
                  "Forget Password?",
                  style: Theme.of(context).textTheme.headline5,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
