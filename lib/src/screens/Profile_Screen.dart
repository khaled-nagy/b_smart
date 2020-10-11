import 'package:b_smart/src/controllers/Change_passController.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:b_smart/src/controllers/Profile_controller.dart';
  class MyProfile extends StatefulWidget {
  @override
    createState() => MyProfileView();
    
       
  }
  class MyProfileView extends StateMVC<MyProfile> {
      MyProfileView() :super (ProfileController()){
    _profileController =     ProfileController.con; 
      }
       ProfileController _profileController;
         
  @override
  Widget build(BuildContext context) {
       return Scaffold(
         appBar: new AppBar(),
       );
  }
     
  }
