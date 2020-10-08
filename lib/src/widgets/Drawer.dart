import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:b_smart/src/screens/newRequests_Screen.dart';
import 'package:b_smart/src/widgets/transions.dart';
import 'package:flutter/material.dart';

class Drawerc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                  height: 200, child: new Image.asset("assets/imgs/logo.png")),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, Scaletransition(screen: HomePage()));
              },
              child: new ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0xff41A6DE),
                ),
                title: Text(
                  "Home Page",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context, Scaletransition(screen: NewRequests()));
              },
              child: new ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0xff41A6DE),
                ),
                title: Text(
                  "New Requests",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ), Divider(),
            new ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xff41A6DE),
              ),
              title: Text(
                "My Requests",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Divider(),
            new ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xff41A6DE),
              ),
              title: Text(
                "My Tasks",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Divider(),
            new ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xff41A6DE),
              ),
              title: Text(
                "My Attendance",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}