import 'package:b_smart/src/controllers/Change_passController.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


  class ChangePassword extends StatefulWidget {
  @override
    createState() => ChangePasswordView();
    
       
  }
  class ChangePasswordView extends StateMVC<ChangePassword> {
      ChangePasswordView() :super (ChangePassController()){
    _changePassController =     ChangePassController.con; 
      }
       ChangePassController _changePassController;
         
  @override
  Widget build(BuildContext context) {
       return Scaffold(appBar: AppBar());
  }
     
  }
