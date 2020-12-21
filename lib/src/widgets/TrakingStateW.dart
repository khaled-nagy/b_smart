import 'dart:async';
import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/MyRequestController.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TrakingStateW extends StatefulWidget {
  final int requestId;
  final String requestType;
  final String requestStatus;
  final int curenStateId;
  TrakingStateW(
      {this.requestId,
      this.requestType,
      this.requestStatus,
      this.curenStateId});
  @override
  _TrakingStateWState createState() => _TrakingStateWState();
}

class _TrakingStateWState extends State<TrakingStateW> {
  @override
  void initState() {
    MyRequestController()
        .getRequestsDetails(widget.requestId, widget.requestType);
    // getRequestsList(widget.requestId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String stepState;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 120,
          child: MyRequestController().requestStatus.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: MyRequestController().requestStatus.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (MyRequestController().requestStatus[index]["id"] <
                        widget.curenStateId) {
                      stepState = "approved";
                    } else if (MyRequestController().requestStatus[index]
                            ["id"] >
                        widget.curenStateId) {
                      stepState = "notStarted";
                    } else {
                      switch (widget.requestStatus) {
                        case "rejected":
                          {
                            stepState = "rejected";
                          }

                          break;
                        case "approved":
                          {
                            stepState = "approved";
                          }

                          break;
                        default:
                          {
                            stepState = "pending";
                          }
                      }
                    }

                    return Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: stepState == "rejected"
                                              ? Colors.red
                                              : stepState == "notStarted"
                                                  ? Colors.green
                                                  : stepState == "approved"
                                                      ? Colors.green
                                                      : Colors.grey,
                                          width: 2),
                                      color: stepState == "rejected"
                                          ? Colors.white
                                          : stepState == "notStarted"
                                              ? Colors.white
                                              : stepState == "approved"
                                                  ? Colors.green
                                                  : Colors.white),
                                  child: stepState == "rejected"
                                      ? Icon(
                                          Icons.cancel_rounded,
                                          color: Colors.red,
                                        )
                                      : stepState == "approved"
                                          ? Icon(
                                              Icons.check_circle,
                                              color: Colors.white,
                                            )
                                          : stepState == "notStarted"
                                              ? Container()
                                              : Container(),
                                ),
                                index !=
                                        MyRequestController()
                                                .requestStatus
                                                .length -
                                            1
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 2, right: 2),
                                        child: Container(
                                          width: size.width / 4,
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(MyRequestController()
                                              .requestStatus[index]
                                          ["foreignName"] ==
                                      null
                                  ? ""
                                  : MyRequestController().requestStatus[index]
                                      ["foreignName"]),
                            ),
                          ],
                        ),
                      ],
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).backgroundColor,
                  ),
                )),
    );
  }

  final getentriesStream = StreamController.broadcast();
  getRequestsList(int requestId) async {
    String url = "${ConstantVarable.baseUrl}/api/requests/$requestId/entries";

    await http.get(url, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json",
      // "Content-Type": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonValu = jsonDecode(response.body);

        getentriesStream.sink.add(jsonValu);
      } else {}
    }, onError: (error) {
      getentriesStream.close();
    });
  }
}
