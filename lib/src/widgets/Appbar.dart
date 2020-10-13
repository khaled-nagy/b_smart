import 'package:b_smart/src/screens/ChangePass_Screen.dart';
import 'package:b_smart/src/screens/Profile_Screen.dart';
import 'package:b_smart/src/screens/login_screen.dart';
import 'package:b_smart/src/screens/new_password_screen.dart';
import 'package:b_smart/src/screens/notifications_screen.dart';
import 'package:flutter/material.dart';

Widget appbar({BuildContext context}) {
  var size = MediaQuery.of(context).size;

  return AppBar(
    actions: [
      Center(child: Text("Ar")),
      Center(
          child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              })),
    ],
    title: Row(
      children: [
        SizedBox(
          width: size.width * 0.2,
        ),
        Container(
          width: size.width * 0.35,
          child: DropdownButton(
            underline: Container(),
            hint: Text("Ahmed adel",
                style: Theme.of(context).textTheme.headline3),
            iconDisabledColor: Theme.of(context).backgroundColor,

            iconEnabledColor: Theme.of(context).backgroundColor,
            //  value: "Ahmed",
            iconSize: 0,
            onChanged: (value) {
              value = "Ahmed";
            },
            items: [
              DropdownMenuItem(
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MyProfile();
                      }));
                    },
                    child: Text("My Profile")),
                value: "Profile",
              ),
              DropdownMenuItem(
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NewPasswordScreen(
                          modifyOrNew: "modify",
                        );
                      }));
                    },
                    child: Text("Change Password")),
                value: "ChangePass",
              ),
              DropdownMenuItem(
                child: InkWell(
                  child: Text("Log Out"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false);
                  },
                ),
                value: "LogOut",
              ),
            ],
          ),
        ),
      ],
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).backgroundColor,
  );
}
