
import 'package:flutter/material.dart';

    class ShowAttendance extends ChangeNotifier {
         bool isDisplay =false;
         diplayattendance(){
           isDisplay=!isDisplay;
              notifyListeners();
         }
    }