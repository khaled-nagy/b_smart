import 'package:b_smart/src/controllers/LoginController.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
