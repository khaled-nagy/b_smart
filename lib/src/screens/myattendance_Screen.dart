import 'package:b_smart/src/controllers/HomePagecontroller.dart';
import 'package:b_smart/src/controllers/my_attendanceController.dart';
import 'package:b_smart/src/data/models/MonthModel.dart';
import 'package:b_smart/src/data/models/YearModel.dart';
import 'package:b_smart/src/statemanagment/show_Attendance.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/AttendanceCard.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/CheckBox.dart';
import 'package:b_smart/src/widgets/DropDown_BtnW.dart';
import 'package:b_smart/src/widgets/TaskCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
  bool isLoadingSignIn = false;
  bool isLoadingSignOut = false;
  String dropDownTitleMonth = "Select Month";
  String dropDowntitleyear = "Select Year";
  MonthModel selectedMonth;
  YearModel selectedYear;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var prov = Provider.of<ShowAttendance>(context);
    String year = " Select Year ";
    String month = " Select Month ";

    return Scaffold(
      appBar: appbar(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            isLoadingSignIn == false
                ? Center(
                    child: ButtonW(
                      height: 50.0,
                      onpress: () {
                        setState(() {
                          isLoadingSignIn = true;
                        });
                        HomePageController()
                            .locationData()
                            .then((locationData) {
                          if (locationData != null) {
                            HomePageController()
                                .signIn(locationData[0], locationData[0],
                                    context, "in")
                                .then((value) {
                              if (value == true) {
                                setState(() {
                                  isLoadingSignIn = false;
                                });
                              } else {
                                setState(() {
                                  isLoadingSignIn = false;
                                });
                              }
                            });
                            print(locationData);
                          } else {
                            print("hello");
                          }
                        });
                      },
                      width: size.width * 0.8,
                      text: "Sign IN",
                      color: Theme.of(context).backgroundColor,
                      textstyle: Theme.of(context).textTheme.headline1,
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).backgroundColor,
                    ),
                  ),
            SizedBox(
              height: size.height * 0.06,
            ),
            isLoadingSignOut == false
                ? Center(
                    child: ButtonW(
                      height: 50.0,
                      onpress: () {
                        setState(() {
                          isLoadingSignOut = true;
                        });
                        HomePageController()
                            .locationData()
                            .then((locationData) {
                          if (locationData != null) {
                            HomePageController()
                                .signIn(locationData[0], locationData[0],
                                    context, "out")
                                .then((value) {
                              if (value == true) {
                                setState(() {
                                  isLoadingSignOut = false;
                                });
                              } else {
                                setState(() {
                                  isLoadingSignOut = false;
                                });
                              }
                            });
                            print(locationData);
                          } else {
                            print("hello");
                          }
                        });
                      },
                      width: size.width * 0.8,
                      text: "Sign Out",
                      color: Theme.of(context).backgroundColor,
                      textstyle: Theme.of(context).textTheme.headline1,
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).backgroundColor,
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
                      "Display Attendance ?",
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
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.grey[500]
                                // ),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: <Widget>[
                                DropdownButton<YearModel>(
                                    hint: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Text(
                                        dropDowntitleyear,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                    underline: Container(),
                                    value: selectedYear,
                                    iconSize: 30,
                                    icon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 14),
                                        child: Icon(Icons.arrow_drop_down)),
                                    items: _myAttendanceController.yearList
                                        .map((YearModel year) {
                                      return DropdownMenuItem<YearModel>(
                                          value: year,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Text(
                                              year.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline,
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (YearModel value) {
                                      setState(() {
                                        selectedYear = value;
                                      });
                                    })
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.grey[500]
                                // ),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: <Widget>[
                                DropdownButton<MonthModel>(
                                    hint: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Text(
                                        dropDownTitleMonth,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                    underline: Container(),
                                    value: selectedMonth,
                                    iconSize: 30,
                                    icon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 14),
                                        child: Icon(Icons.arrow_drop_down)),
                                    items: _myAttendanceController.monthlist
                                        .map((MonthModel month) {
                                      return DropdownMenuItem<MonthModel>(
                                          value: month,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Text(
                                              month.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline,
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (MonthModel value) {
                                      setState(() {
                                        selectedMonth = value;
                                      });
                                    })
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            selectedMonth != null && selectedYear != null
                ? ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return AttendanceCard();
                    })
                : Container()
          ],
        ),
      ),
    );
  }
}
