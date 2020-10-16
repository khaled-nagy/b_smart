import 'package:flutter/material.dart';
gauimport 'package:easy_localization/easy_localization.dart';
class NotificationCard extends StatefulWidget {
  final int poision;
  NotificationCard({this.poision});
  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            height: 100,
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
                      "_notificatin_1",
                      style: Theme.of(context).textTheme.headline2,
                    ).tr(),
                    Text(
                      "_notificatin_1",
                      style: Theme.of(context).textTheme.bodyText2,
                    ).tr(),
                    Text(
                      "July 20.2020 (08:00 pm)",
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
                      "_notificatin_1",
                      style: Theme.of(context).textTheme.headline2,
                    ).tr(),
                  ));
        },
      ),
    );
  }
}
