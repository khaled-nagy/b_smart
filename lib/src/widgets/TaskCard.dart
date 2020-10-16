import 'package:b_smart/src/screens/RequestDetailes_Screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class TaskCard extends StatefulWidget {
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return MyRequestDetailes();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("#30",
                            style: Theme.of(context).textTheme.headline2),
                        Text(
                          "_Vacation_request",
                          style: Theme.of(context).textTheme.headline2,
                        ).tr(),
                        Text("15-10-2020" + " ( 5:00 PM )",
                            style: Theme.of(context).textTheme.headline5)
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "_Approved",
                          style: Theme.of(context).textTheme.headline3,
                        ).tr(),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
