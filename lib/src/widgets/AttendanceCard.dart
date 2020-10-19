import 'package:flutter/material.dart';

class AttendanceCard extends StatefulWidget {
  final Map<String, dynamic> data;
  AttendanceCard({this.data});
  @override
  _AttendanceCardState createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                    Text("15/11/1993",
                        style: Theme.of(context).textTheme.headline2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "From  08:00 am",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          "To       05:00 bm",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
