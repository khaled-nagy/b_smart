import 'package:flutter/material.dart';
import 'package:b_smart/src/controllers/NotificationController.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/screens/ProfileScreen.dart';
import 'package:b_smart/src/screens/LoginScreen.dart';
import 'package:b_smart/src/screens/NewPasswordScreen.dart';
import 'package:b_smart/src/screens/NotificationsScreen.dart';
import 'package:b_smart/src/screens/SetingsScreen.dart';
import 'package:easy_localization/easy_localization.dart';

class AppBarWidget {
  Widget showAppBar(
      BuildContext context, String title, Widget widget, bool home,
      {int position}) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      actions: [
        InkWell(
          onTap: () {
            switch (EasyLocalization.of(context).locale.toLanguageTag()) {
              case "ar":
                {
                  EasyLocalization.of(context).locale = Locale("en");
                }

                break;
              case "en":
                {
                  EasyLocalization.of(context).locale = Locale("ar");
                }

                break;
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Center(
                child: Text(EasyLocalization.of(context).locale.toString())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Stack(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.notification_important,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                  }),
              Align(
                alignment: Alignment.topRight,
                child: Text(NotificationController().notificationList.length > 0
                    ? NotificationController()
                        .notificationList
                        .length
                        .toString()
                    : ""),
              )
            ],
          ),
        )
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.width / 2,
            child: DropdownButton(
              underline: Container(),
              hint: Center(
                child: Text(UserController.userNameController.text,
                    style: Theme.of(context).textTheme.headline3),
              ),

              iconDisabledColor: Theme.of(context).backgroundColor,

              iconEnabledColor: Colors.white,
              //  value: "Ahmed",
              iconSize: 25,
              isExpanded: true,
              onChanged: (value) {},
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
                      child: Row(
                        children: [
                          Text("_My_Profile").tr(),
                        ],
                      )),
                  value: "Profile",
                ),
                DropdownMenuItem(
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SetingsScreen();
                        }));
                      },
                      child: Row(
                        children: [
                          Text("_settings".tr()),
                        ],
                      )),
                  value: "settings",
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
                      child: Row(
                        children: [
                          Text("_Change_Passwrod").tr(),
                        ],
                      )),
                  value: "ChangePass",
                ),
                DropdownMenuItem(
                  child: InkWell(
                    child: Row(
                      children: [
                        Text("_log_Out").tr(),
                      ],
                    ),
                    onTap: () {
                      UserController().clearTextFields();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
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
}
