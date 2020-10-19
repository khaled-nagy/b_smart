import 'package:b_smart/src/controllers/MyRequestController.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class MyRequestDetailes extends StatefulWidget {
  final int id;
  final String requestType;
  final String taskOrRequest;
  MyRequestDetailes({this.id, this.requestType, this.taskOrRequest});
  @override
  createState() => MyRequestDetailesView();
}

class MyRequestDetailesView extends StateMVC<MyRequestDetailes> {
  MyRequestDetailesView() : super(MyRequestController()) {
    _myRequestController = MyRequestController.con;
  }
  MyRequestController _myRequestController;
  @override
  void initState() {
    _myRequestController.getRequestsDetails(widget.id, widget.requestType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appbar(context: context),
        body: StreamBuilder(
          stream: _myRequestController.getRequestsDetailsStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> data = snapshot.data;
              return SingleChildScrollView(
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          widget.taskOrRequest == "task"
                              ? "Task Detailes"
                              : "Request Detailes",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.code,
                                color: Theme.of(context).backgroundColor,
                                size: 30.0,
                              ),
                              title: Text(
                                  widget.taskOrRequest == "task"
                                      ? "Task Code:"
                                      : "Request Code: ",
                                  style: TextStyle(fontSize: 20.0)),
                              subtitle: Container(
                                  child: new Text(data["code"] == null
                                      ? "#"
                                      : "#${data["code"]}")),
                            )),
                      ),
                      Card(
                        elevation: 2,
                        child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ListTile(
                              leading: Icon(Icons.request_page,
                                  color: Theme.of(context).backgroundColor,
                                  size: 30.0),
                              title: Text(
                                  widget.taskOrRequest == "task"
                                      ? "Task Type:"
                                      : "Request Type: ",
                                  style: TextStyle(fontSize: 20.0)),
                              subtitle: Container(
                                  child: new Text(data["requestType"] == null
                                      ? ""
                                      : "${data["requestType"]}")),
                            )),
                      ),
                      Card(
                        elevation: 2,
                        child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ListTile(
                              leading: Icon(Icons.date_range,
                                  color: Theme.of(context).backgroundColor,
                                  size: 30.0),
                              title: Text("Date: ",
                                  style: TextStyle(fontSize: 20.0)),
                              subtitle: Container(
                                  child: new Text(data["requestDate"] == null
                                      ? ""
                                      : "${data["requestDate"]}")),
                            )),
                      ),
                      Card(
                        elevation: 2,
                        child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ListTile(
                              leading: Icon(Icons.code,
                                  color: Theme.of(context).backgroundColor,
                                  size: 30.0),
                              title: Text("State: ",
                                  style: TextStyle(fontSize: 20.0)),
                              trailing: Container(
                                  child: new Text(
                                data["status"] == null
                                    ? ""
                                    : "${data["status"]}",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 18.0),
                              )),
                            )),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
              );
            }
          },
        ));
  }
}
