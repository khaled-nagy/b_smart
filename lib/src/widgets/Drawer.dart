import 'package:b_smart/src/screens/homePage_Screen.dart';
import 'package:b_smart/src/screens/my_Requests.dart';
import 'package:b_smart/src/screens/my_Tasks.dart';
import 'package:b_smart/src/screens/myattendance_Screen.dart';
import 'package:b_smart/src/screens/newRequests_Screen.dart';
import 'package:b_smart/src/widgets/transions.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
                Navigator.pushAndRemoveUntil(
                    context,
                    Scaletransition(screen: HomeScreen()),
                    (Route<dynamic> route) => false);
              },
              child: new ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).backgroundColor,
                ),
                title: Text(
                  "_Home_Page",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context, Scaletransition(screen: NewRequests()));
              },
              child: new ListTile(
                leading: Icon(
                  Icons.note_add_outlined,
                  color: Theme.of(context).backgroundColor,
                ),
                title: Text(
                  "_New_Request",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, Scaletransition(screen: (MyRequestScreen())));
              },
              child: new ListTile(
                leading: Icon(
                  Icons.format_list_bulleted,
                  color: Theme.of(context).backgroundColor,
                ),
                title: Text(
                  "_My_Requests",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context, Scaletransition(screen: (MyTasks())));
              },
              child: new ListTile(
                leading: Icon(
                  Icons.list_alt_outlined,
                  color: Theme.of(context).backgroundColor,
                ),
                title: Text(
                  "_My_Tasks",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, Scaletransition(screen: (MyAttendance())));
              },
              child: new ListTile(
                leading: Container(
                    height: 30.0,
                    width: 30.0,
                    child: Image.asset(
                      "assets/imgs/attendance.png",
                      color: Theme.of(context).backgroundColor,
                    )),
                title: Text(
                  "_My_Attendance",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
