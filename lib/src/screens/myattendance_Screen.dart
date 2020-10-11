import 'package:b_smart/src/controllers/Change_passController.dart';
import 'package:b_smart/src/controllers/my_attendanceController.dart';
import 'package:b_smart/src/statemanagment/show_Attendance.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/CheckBox.dart';
import 'package:b_smart/src/widgets/DropDown_BtnW.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:b_smart/src/controllers/Profile_controller.dart';
import 'package:provider/provider.dart';

class MyAttendance extends StatefulWidget {
  @override
  createState() => MyAttendanceView();
}

class MyAttendanceView extends StateMVC<MyAttendance> {
  MyAttendanceView() : super(MyAttendanceController()) {
    _myAttendanceController = MyAttendanceController.con;
  }
  MyAttendanceController _myAttendanceController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var prov = Provider.of<ShowAttendance>(context);

    return Scaffold(
      appBar: appbar(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Center(
              child: ButtonW(
                height: 50.0,
                onpress: () {},
                width: size.width * 0.8,
                text: "Sign IN",
                color: Theme.of(context).backgroundColor,
                textstyle: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Center(
              child: ButtonW(
                height: 50.0,
                onpress: () {},
                width: size.width * 0.8,
                text: "Sign Out",
                color: Theme.of(context).backgroundColor,
                textstyle: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            new Divider(
              thickness: 0.8,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      ". Display Attendance ?",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  CheckBoxW()
                ],
              ),
            ),
            prov.isDisplay == true
                ? Container(
                    width: size.width,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          child: DropDownW(
                            width: size.width*0.4,
                            isexpanded: true,
                            onchanged: (value) {},
                            hint: Text(
                              " Select Year ",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text("test"),
                                value: "test",
                              ),
                              DropdownMenuItem(
                                child: Text("test"),
                                value: "test",
                              ),
                              DropdownMenuItem(
                                child: Text("test"),
                                value: "test",
                              )
                            ],
                          ),
                        ),
                        Card(
                                                  child: DropDownW(

                             width: size.width*0.4,
                            isexpanded: true,
                            onchanged: (value) {},
                            hint: Text(
                              " Select Month ",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text("test"),
                                value: "test",
                              ),
                              DropdownMenuItem(
                                child: Text("test"),
                                value: "test",
                              ),
                              DropdownMenuItem(
                                child: Text("test"),
                                value: "test",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
