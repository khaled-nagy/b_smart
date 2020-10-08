import 'package:b_smart/src/controllers/LoginController.dart';
import 'package:b_smart/src/widgets/BottomNavigationBar.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/Dropdownbtn.dart';
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
      bottomNavigationBar:  BottomNavigationbar(),
      backgroundColor: Color(0xffF4F4F4),
      body: SingleChildScrollView(
        child: Form(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 100.0,
              ),
              Container(
                height: 200,
                width: 200,
                child: Image.asset("assets/imgs/logo.png"),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormFieldC(
                width: size.width * 0.88,
                height: 52,
                labeltext: "Domain/Username",
              ),
              SizedBox(
                height: 40,
              ),
              TextFormFieldC(
                width: size.width * 0.88,
                height: 52,
                labeltext: "Password",
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: size.width * 0.88,
                height: 28.0,
                child: Text(
                  "Language",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              DropDownButton(),
              SizedBox(
                height: 30.0,
              ),
              ButtonC(
                onpress: (){
                  _loginController.loginButton(context);
                },
                height: 43,
                width: size.width * 0.75,
                color: Theme.of(context).accentIconTheme.color,
                text: "Log In",
                textstyle: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 25,),
              InkWell(
                child: Text("Forget Password?",style: Theme.of(context).textTheme.headline2,),
              )
            ],
          )),
        ),
      ),
    );
  }
}
