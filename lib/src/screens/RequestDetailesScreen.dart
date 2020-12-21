import 'package:b_smart/src/controllers/MyRequestController.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:flutter/cupertino.dart';
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
  int currentStep = 0;
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
        body: _myRequestController.requestDetails.isNotEmpty
            ? SingleChildScrollView(
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
                      Container(
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.grey)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2, right: 2),
                                    child: Container(
                                      width: size.width / 4,
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              );
                            }),
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
                                  child: new Text(_myRequestController
                                              .requestDetails["code"] ==
                                          null
                                      ? "#"
                                      : "#${_myRequestController.requestDetails["code"]}")),
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
                                  child: new Text(_myRequestController
                                              .requestDetails["requestType"] ==
                                          null
                                      ? ""
                                      : "${_myRequestController.requestDetails["requestType"]}")),
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
                                  child: new Text(_myRequestController
                                              .requestDetails["requestDate"] ==
                                          null
                                      ? ""
                                      : "${_myRequestController.requestDetails["requestDate"]}")),
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
                                _myRequestController.requestDetails["status"] ==
                                        null
                                    ? ""
                                    : "${_myRequestController.requestDetails["status"]}",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 18.0),
                              )),
                            )),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
              ));
  }
}
