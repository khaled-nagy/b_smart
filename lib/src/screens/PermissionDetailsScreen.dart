import 'package:b_smart/src/controllers/MyRequestController.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/TrakingStateW.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

class PermissionDetailsScreen extends StatefulWidget {
  final int id;
  final String requestType;
  final String taskOrRequest;
  PermissionDetailsScreen({this.id, this.requestType, this.taskOrRequest});
  @override
  createState() => PermissionDetailsView();
}

class PermissionDetailsView extends StateMVC<PermissionDetailsScreen> {
  PermissionDetailsView() : super(MyRequestController()) {
    _myRequestController = MyRequestController.con;
  }
  MyRequestController _myRequestController;
  int currentStep = 0;
  bool isLoading = false;
  @override
  void initState() {
    isLoading = true;
    _myRequestController
        .getRequestsDetails(widget.id, widget.requestType)
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appbar(context: context),
        body: isLoading == false
            ? SingleChildScrollView(
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          widget.taskOrRequest == "task"
                              ? "_task_detailes".tr()
                              : "_request_detailes".tr(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      TrakingStateW(
                        requestId: widget.id,
                        curenStateId: _myRequestController
                            .requestDetails["currentStateId"],
                        requestType:
                            _myRequestController.requestDetails["requestType"],
                        requestStatus:
                            _myRequestController.requestDetails["status"],
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
                                      ? "_task_code".tr()
                                      : "_request_code".tr(),
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
                                      ? "_task_type".tr()
                                      : "_request_type".tr(),
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
                              title: Text("_date".tr(),
                                  style: TextStyle(fontSize: 20.0)),
                              subtitle: Container(
                                  child: new Text(_myRequestController
                                              .requestDetails["requestDate"] ==
                                          null
                                      ? ""
                                      : "${_myRequestController.requestDetails["requestDate"].toString().substring(0, 10)}")),
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
                              title: Text("_state".tr(),
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
                      Card(
                        elevation: 2,
                        child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ListTile(
                              leading: Icon(Icons.calendar_view_day_sharp,
                                  color: Theme.of(context).backgroundColor,
                                  size: 30.0),
                              title: Text("_Duration".tr(),
                                  style: TextStyle(fontSize: 20.0)),
                              subtitle: Container(
                                  child: new Text(_myRequestController
                                                  .requestDetails["details"]
                                              ["duration"] ==
                                          null
                                      ? ""
                                      : "${_myRequestController.requestDetails["details"]["duration"]}")),
                            )),
                      ),
                      Card(
                        elevation: 2,
                        child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ListTile(
                              leading: Icon(Icons.calendar_today,
                                  color: Theme.of(context).backgroundColor,
                                  size: 30.0),
                              title: Text("_start_time".tr(),
                                  style: TextStyle(fontSize: 20.0)),
                              subtitle: Container(
                                  child: new Text(_myRequestController
                                                  .requestDetails["details"]
                                              ["startTime"] ==
                                          null
                                      ? ""
                                      : "${_myRequestController.requestDetails["details"]["startTime"]}")),
                            )),
                      ),
                      Card(
                        elevation: 2,
                        child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ListTile(
                              leading: Icon(Icons.calendar_today,
                                  color: Theme.of(context).backgroundColor,
                                  size: 30.0),
                              title: Text("_end_Time".tr(),
                                  style: TextStyle(fontSize: 20.0)),
                              subtitle: Container(
                                  child: new Text(_myRequestController
                                                  .requestDetails["details"]
                                              ["endTime"] ==
                                          null
                                      ? ""
                                      : "${_myRequestController.requestDetails["details"]["endTime"]}")),
                            )),
                      ),
                      Card(
                        elevation: 2,
                        child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ListTile(
                              leading: Icon(Icons.calendar_today,
                                  color: Theme.of(context).backgroundColor,
                                  size: 30.0),
                              title: Text("_Notes".tr(),
                                  style: TextStyle(fontSize: 20.0)),
                              subtitle: Container(
                                  child: new Text(_myRequestController
                                                  .requestDetails["details"]
                                              ["notes"] ==
                                          null
                                      ? ""
                                      : "${_myRequestController.requestDetails["details"]["notes"]}")),
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
