import 'package:b_smart/src/controllers/HomePagecontroller.dart';
import 'package:b_smart/src/screens/VacationOrPermissitionScreen.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/Drawer.dart';
import 'package:b_smart/src/widgets/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  @override
  createState() => HomeView();
}

class HomeView extends StateMVC<HomeScreen> {
  HomeView() : super(HomePageController()) {
    _homePageController = HomePageController.con;
  }
  HomePageController _homePageController;
  bool isLoadingSignIn = false;
  bool isLoadingSignOut = false;
  @override
  void initState() {
    _homePageController.getDashBordData().then((value) {
      if (value == true) {}
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawerc(),
      appBar: appbar(context: context, home: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.06,
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

                          _homePageController
                              .signInOutValidator(context, "in")
                              .then((value) {
                            if (value != true) {
                              setState(() {
                                isLoadingSignIn = false;
                              });
                              SharedWidget.customAlertDialog(
                                  context, "You are already in attendance", () {
                                _homePageController
                                    .locationData()
                                    .then((locationData) {
                                  if (locationData != null) {
                                    _homePageController
                                        .signIn(locationData[0],
                                            locationData[0], context, "in")
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
                                  } else {}
                                });
                              });
                            } else {
                              _homePageController
                                  .locationData()
                                  .then((locationData) {
                                if (locationData != null) {
                                  _homePageController
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
                        height: 50.0,
                        borderradius: BorderRadius.circular(12),
                        onpress: () {
                          setState(() {
                            isLoadingSignOut = true;
                          });

                          _homePageController
                              .signInOutValidator(context, "out")
                              .then((value) {
                            if (value != true) {
                              setState(() {
                                isLoadingSignOut = false;
                              });
                              SharedWidget.customAlertDialog(
                                  context, "You are already in attendance", () {
                                _homePageController
                                    .locationData()
                                    .then((locationData) {
                                  if (locationData != null) {
                                    _homePageController
                                        .signIn(locationData[0],
                                            locationData[0], context, "out")
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
                                  } else {}
                                });
                              });
                            } else {
                              _homePageController
                                  .locationData()
                                  .then((locationData) {
                                if (locationData != null) {
                                  _homePageController
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
                height: size.height * 0.06,
              ),
              ButtonW(
                borderradius: BorderRadius.circular(12),
                width: size.width * 0.8,
                text: "_Vacation_request".tr(),
                color: Theme.of(context).backgroundColor,
                textstyle: Theme.of(context).textTheme.headline1,
                onpress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VacationOrPermissionScreen(
                              vacationOrPermission: "vacation")));
                },
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              ButtonW(
                  borderradius: BorderRadius.circular(12),
                  width: size.width * 0.8,
                  text: "_Permission_Request".tr(),
                  color: Theme.of(context).backgroundColor,
                  textstyle: Theme.of(context).textTheme.headline1,
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VacationOrPermissionScreen(
                                vacationOrPermission: "permission")));
                  }),
              Container(
                height: 32,
              ),
              _homePageController.dashBordData.isNotEmpty
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "_available_Vacation_Balance".tr(),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Container(
                              width: 16,
                            ),
                            Text(
                              _homePageController.dashBordData[
                                          "availableVacationBalance"] ==
                                      null
                                  ? "0"
                                  : _homePageController
                                      .dashBordData["availableVacationBalance"]
                                      .toString(),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                        Container(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "_Vacations_balance_remaining".tr(),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Container(
                              width: 16,
                            ),
                            Text(
                              _homePageController.dashBordData[
                                          "consumedVacationBalance"] ==
                                      null
                                  ? "0"
                                  : _homePageController
                                      .dashBordData["consumedVacationBalance"]
                                      .toString(),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                      ],
                    )
                  : CircularProgressIndicator(
                      backgroundColor: Theme.of(context).backgroundColor,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
