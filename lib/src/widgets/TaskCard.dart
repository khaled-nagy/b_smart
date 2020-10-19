import 'package:b_smart/src/screens/RequestDetailes_Screen.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final Map<String, dynamic> data;
  TaskCard({this.data});
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    Color stateClolor;
    switch (widget.data["status"]) {
      case "rejected":
        {
          stateClolor = Color(0xffd9534f);
        }

        break;
      case "new":
        {
          stateClolor = Color(0xff5bc0de);
        }

        break;
      case "approved":
        {
          stateClolor = Color(0xff5cb85c);
        }

        break;
    }
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return MyRequestDetailes(
            id: widget.data['id'],
            requestType: widget.data["requestType"],
            taskOrRequest: "task",
          );
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
                        Text(
                            widget.data["code"] == null
                                ? "#"
                                : "#${widget.data["code"]}",
                            style: Theme.of(context).textTheme.headline2),
                        Text(
                          widget.data["requestType"] == null
                              ? ""
                              : "${widget.data["requestType"]}",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                            widget.data["requestDate"] == null
                                ? ""
                                : "${widget.data["requestDate"]}",
                            style: Theme.of(context).textTheme.headline5)
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: stateClolor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.data["status"] == null
                              ? ""
                              : "${widget.data["status"]}",
                          style: Theme.of(context).textTheme.headline3,
                        ),
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
