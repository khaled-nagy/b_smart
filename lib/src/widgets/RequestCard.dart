import 'package:b_smart/src/screens/RequestDetailes_Screen.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatefulWidget {
  final Map<String, dynamic> data;
  RequestCard({this.data});
  @override
  _RequestCardState createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return MyRequestDetailes(
            id: widget.data['id'],
            requestType: widget.data["requestType"],
            taskOrRequest: "request",
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
                        color: Colors.red,
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
