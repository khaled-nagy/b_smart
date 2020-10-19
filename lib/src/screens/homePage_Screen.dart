import 'package:b_smart/src/controllers/HomePagecontroller.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawerc(),
      appBar: appbar(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.25,
            ),
            isLoadingSignIn == false
                ? Center(
                    child: ButtonW(
                      height: 50.0,
                      onpress: () {
                        setState(() {
                          isLoadingSignIn = true;
                        });
                        _homePageController.locationData().then((locationData) {
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
                        _homePageController.locationData().then((locationData) {
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
          ],
        ),
      ),
    );
  }
}
