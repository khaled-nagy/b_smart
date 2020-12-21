import 'package:b_smart/src/controllers/NotificationController.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/NotificationCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class NotificationScreen extends StatefulWidget {
  createState() => NotificationView();
}

class NotificationView extends StateMVC<NotificationScreen> {
  NotificationView() : super(NotificationController()) {
    _notificationController = NotificationController.con;
  }

  NotificationController _notificationController;
  bool isloading = false;
  bool isRemember = false;

  @override
  void initState() {
    _notificationController.getAllNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context: context, home: true, notification: true),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[50]),
        child: _notificationController.notificationList != null
            ? _notificationController.notificationList.length > 0
                ? ListView.builder(
                    itemCount: _notificationController.notificationList.length,
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        data: _notificationController.notificationList[index],
                      );
                    })
                : Center(
                    child: Text(
                      "There Is No Notifications",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  )
            : CircularProgressIndicator(
                backgroundColor: Theme.of(context).backgroundColor,
              ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
