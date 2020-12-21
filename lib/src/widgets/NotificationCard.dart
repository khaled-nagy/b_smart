import 'package:b_smart/src/controllers/NotificationController.dart';
import 'package:b_smart/src/data/models/NotificationModel.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationCard extends StatefulWidget {
  final NotificationModel data;
  NotificationCard({this.data});
  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    String message = widget.data.message;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            height: 122,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.data.title,
                      style: Theme.of(context).textTheme.headline2,
                    ).tr(),
                    Text(
                      message.length > 50
                          ? message.substring(0, 35) + "..."
                          : message,
                      style: Theme.of(context).textTheme.bodyText2,
                    ).tr(),
                    Text(
                      widget.data.notificationDate.toString(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    content: Text(
                      widget.data.message,
                      style: Theme.of(context).textTheme.headline2,
                    ).tr(),
                  ));
          NotificationController()
              .readNotification(widget.data.id)
              .then((value) {
            if (value == true) {
              NotificationController().getAllNotifications();
            } else {}
          });
        },
      ),
    );
  }
}
