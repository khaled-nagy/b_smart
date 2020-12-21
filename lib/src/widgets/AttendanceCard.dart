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
                  children: [
                    Text(
                        widget.data["dayDate"] == null
                            ? ""
                            : widget.data["dayDate"],
                        style: Theme.of(context).textTheme.headline5),
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                    ),
                    Text(
                      widget.data["inTime"] == null
                          ? ""
                          : widget.data["inTime"],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    Text(
                      widget.data["outTime"] == null
                          ? ""
                          : widget.data["outTime"],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
