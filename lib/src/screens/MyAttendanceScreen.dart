import 'package:b_smart/src/controllers/HomePagecontroller.dart';
import 'package:b_smart/src/controllers/MyAttendanceController.dart';
import 'package:b_smart/src/data/models/MonthModel.dart';
import 'package:b_smart/src/data/models/YearModel.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/AttendanceCard.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/SharedWidget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

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
  void initState() {
    MyAttendanceController.attendanceCalender = "";
    _myAttendanceController.getAttendanceList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                      borderradius: BorderRadius.circular(12),
                      height: 50.0,
                      onpress: () {
                        setState(() {
                          isLoadingSignIn = true;
                        });

                        HomePageController()
                            .signInOutValidator(context, "in")
                            .then((value) {
                          if (value != true) {
                            setState(() {
                              isLoadingSignIn = false;
                            });
                            SharedWidget.customAlertDialog(
                                context, "You are already in attendance", () {
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
                                        _myAttendanceController
                                            .getAttendanceList();
                                      });
                                    } else {
                                      setState(() {
                                        isLoadingSignIn = false;
                                      });
                                    }
                                  });
                                } else {}
                              });
                            });
                          } else {
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
                                      _myAttendanceController
                                          .getAttendanceList();
                                    });
                                  } else {
                                    setState(() {
                                      isLoadingSignIn = false;
                                    });
                                  }
                                });
                              } else {}
                            });
                          }
                        });
                      },
                      width: size.width * 0.8,
                      text: "_sign_in".tr(),
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
                      borderradius: BorderRadius.circular(12),
                      height: 50.0,
                      onpress: () {
                        setState(() {
                          isLoadingSignOut = true;
                        });

                        HomePageController()
                            .signInOutValidator(context, "out")
                            .then((value) {
                          if (value != true) {
                            setState(() {
                              isLoadingSignOut = false;
                            });
                            SharedWidget.customAlertDialog(
                                context, "You are already in attendance", () {
                              HomePageController()
                                  .locationData()
                                  .then((locationData) {
                                if (locationData != null) {
                                  HomePageController()
                                      .signIn(locationData[0], locationData[0],
                                          context, "out")
                                      .then((value) {
                                    if (value == true) {
                                      _myAttendanceController
                                          .getAttendanceList();
                                      setState(() {
                                        isLoadingSignOut = false;
                                      });
                                    } else {
                                      setState(() {
                                        isLoadingSignOut = false;
                                      });
                                    }
                                  });
                                } else {}
                              });
                            });
                          } else {
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
                                      _myAttendanceController
                                          .getAttendanceList();
                                    });
                                  } else {
                                    setState(() {
                                      isLoadingSignOut = false;
                                    });
                                  }
                                });
                              } else {}
                            });
                          }
                        });
                      },
                      width: size.width * 0.8,
                      text: "_sign_Up".tr(),
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
            Container(
              width: size.width / 1.1,
              child: DateTimePicker(
                cursorColor: Theme.of(context).backgroundColor,
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2021),
                icon: Icon(Icons.calendar_today_rounded),
                dateLabelText: '',
                onChanged: (val) {
                  MyAttendanceController.attendanceCalender = val;

                  _myAttendanceController.getAttendanceList();
                  setState(() {});
                },
                validator: (val) {
                  return null;
                },
                onSaved: (val) {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "_day_date".tr(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "_in_time".tr(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "_out_time".tr(),
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
            _myAttendanceController.attendanceList.length > 0
                ? ListView.builder(
                    itemCount: _myAttendanceController.attendanceList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return AttendanceCard(
                        data: _myAttendanceController.attendanceList[index],
                      );
                    })
                : _myAttendanceController.attendanceList.length == 0
                    ? Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Text(
                          "There is no Data ",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Theme.of(context).backgroundColor,
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
