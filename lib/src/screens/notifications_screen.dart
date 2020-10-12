import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/NotificationCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class NotificationScreen extends StatefulWidget {
  createState() => NotificationView();
}

class NotificationView extends StateMVC<NotificationScreen> {
  NotificationView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;
  bool isloading = false;
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context: context),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[50]),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return NotificationCard(
                poision: index,
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
