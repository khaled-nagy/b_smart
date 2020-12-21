import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

class MyProfile extends StatefulWidget {
  @override
  createState() => MyProfileView();
}

class MyProfileView extends StateMVC<MyProfile> {
  MyProfileView() : super(UserController()) {
    _userController = UserController.con;
  }
  UserController _userController;

  @override
  void initState() {
    _userController.getUserProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: new AppBar(
          elevation: 0,
          title: Text("_my_profile".tr()),
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: _userController.userData.isNotEmpty
            ? SingleChildScrollView(
                child: Stack(
                  children: [
                    new Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                      height: 280,
                      width: size.width,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 245),
                        child: Center(
                          child: Container(
                              width: size.width / 1.2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _userController.userData[
                                                    "employeeForeignName"] ==
                                                null
                                            ? "userName"
                                            : EasyLocalization.of(context)
                                                        .locale
                                                        .languageCode ==
                                                    "en"
                                                ? _userController.userData[
                                                    "employeeForeignName"]
                                                : _userController.userData[
                                                    "employeeLocalName"],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      Text(
                                        _userController.userData[
                                                    "departmentForeignName"] ==
                                                null
                                            ? "userName"
                                            : EasyLocalization.of(context)
                                                        .locale
                                                        .languageCode ==
                                                    "en"
                                                ? _userController.userData[
                                                    "departmentForeignName"]
                                                : _userController.userData[
                                                    "departmentLocalName"],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 340),
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.code),
                          title: Text("_code".tr()),
                          subtitle: Text(
                              _userController.userData["employeeCode"] == null
                                  ? ""
                                  : "#" +
                                      _userController.userData["employeeCode"]
                                          .toString()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 435),
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.data_usage),
                          title: Text("_hire_date".tr()),
                          subtitle: Text(
                              _userController.userData["hireDate"] == null
                                  ? ""
                                  : _userController.userData["hireDate"]
                                      .toString()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 535),
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text("_location".tr()),
                          subtitle: Text(
                              _userController.userData["locationForeignName"] ==
                                      null
                                  ? ""
                                  : EasyLocalization.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? _userController
                                          .userData["locationForeignName"]
                                          .toString()
                                      : _userController
                                          .userData["locationLocalName"]
                                          .toString()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 635),
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.dashboard_customize),
                          title: Text("_Position_".tr()),
                          subtitle: Text(
                              _userController.userData["positionForeignName"] ==
                                      null
                                  ? ""
                                  : EasyLocalization.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? _userController
                                          .userData["positionForeignName"]
                                      : _userController
                                          .userData["positionLocalName"]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Container(
                              child: _userController
                                          .userData["profileImageUrl"] ==
                                      null
                                  ? ClipOval(
                                      child: Icon(
                                        Icons.supervised_user_circle_rounded,
                                        size: 150,
                                        color: Colors.white,
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 70,
                                      backgroundImage: NetworkImage(
                                        _userController
                                            .userData["profileImageUrl"],
                                      ),
                                    ),
                            ),
                            Text(
                              UserController.userNameController.text == null
                                  ? "userName"
                                  : UserController.userNameController.text,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
              ));
  }
}
