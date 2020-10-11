import 'package:b_smart/src/statemanagment/show_Attendance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckBoxW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShowAttendance>(
      builder: (context,notifier,child){
           return    Checkbox(
             checkColor: Colors.red, 
              focusColor:Colors.red  ,
        onChanged: (bool value) {
          notifier.diplayattendance();
          print(notifier.isDisplay.toString());
        },
        value: notifier.isDisplay,
      );
      },
            
    );
  }
}
