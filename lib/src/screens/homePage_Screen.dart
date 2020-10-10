import 'package:b_smart/src/controllers/HomePagecontroller.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:b_smart/src/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => HomePageView();
}

class HomePageView extends StateMVC<HomePage> {
  HomePageView() : super(HomePageController()) {
    _homePageController = HomePageController.con;
  }
  HomePageController _homePageController;
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
            )
          ],
        ),
      ),
    );
  }
}
