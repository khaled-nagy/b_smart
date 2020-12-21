import 'package:b_smart/src/controllers/MyTasksController.dart';
import 'package:b_smart/src/screens/AssignmentDetailsScreen.dart';
import 'package:b_smart/src/screens/BalanceDetailsScreen.dart';
import 'package:b_smart/src/screens/LoanDetailsScreen.dart';
import 'package:b_smart/src/screens/PayrollDetailsScreen.dart';
import 'package:b_smart/src/screens/PermissionDetailsScreen.dart';
import 'package:b_smart/src/screens/TerminationDetailsScreen.dart';
import 'package:b_smart/src/screens/VacationDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TaskCard extends StatefulWidget {
  final Map<String, dynamic> data;
  TaskCard({this.data});
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isLoadingApprove = false;
  bool isLoadingReject = false;
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
          switch (widget.data["requestType"]) {
            case "vacation":
              {
                return VacationDetailsScreen(
                  id: widget.data['id'],
                  requestType: widget.data["requestType"],
                  taskOrRequest: "request",
                );
              }

              break;
            case "permission":
              {
                return PermissionDetailsScreen(
                  id: widget.data['id'],
                  requestType: widget.data["requestType"],
                  taskOrRequest: "request",
                );
              }

              break;
            case "assignmentChange":
              {
                return AssignmentDetailsScreen(
                  id: widget.data['id'],
                  requestType: widget.data["requestType"],
                  taskOrRequest: "request",
                );
              }

              break;
            case "vacationBalanceAdjustment":
              {
                return BalanceDetailsScreen(
                  id: widget.data['id'],
                  requestType: widget.data["requestType"],
                  taskOrRequest: "request",
                );
              }

              break;
            case "penalty":
              {
                return PermissionDetailsScreen(
                  id: widget.data['id'],
                  requestType: widget.data["requestType"],
                  taskOrRequest: "request",
                );
              }

              break;
            case "termination":
              {
                return TerminationDetailsScreen(
                  id: widget.data['id'],
                  requestType: widget.data["requestType"],
                  taskOrRequest: "request",
                );
              }

              break;
            case "loan":
              {
                return LoanDetailsScreen(
                  id: widget.data['id'],
                  requestType: widget.data["requestType"],
                  taskOrRequest: "request",
                );
              }

              break;

            case "salaryChange":
              {
                return PermissionDetailsScreen(
                  id: widget.data['id'],
                  requestType: widget.data["requestType"],
                  taskOrRequest: "request",
                );
              }

              break;
            case "payrollAdjustment":
              {
                return PayrollDetailsScreen(
                  id: widget.data['id'],
                  requestType: widget.data["requestType"],
                  taskOrRequest: "request",
                );
              }

              break;
            case "delegation":
              {
                return PermissionDetailsScreen(
                  id: widget.data['id'],
                  requestType: widget.data["requestType"],
                  taskOrRequest: "request",
                );
              }

              break;
          }
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
                        Row(
                          children: [
                            Text(
                                widget.data["code"] == null
                                    ? "#"
                                    : "#${widget.data["code"]}",
                                style: Theme.of(context).textTheme.headline2),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: Text(
                                widget.data["requestType"] == null
                                    ? ""
                                    : widget.data["requestType"].length > 15
                                        ? widget.data["requestType"]
                                                .toString()
                                                .substring(0, 15) +
                                            "..."
                                        : "${widget.data["requestType"]}",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: stateClolor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.data["employeeForeignName"] == null
                              ? ""
                              : "${widget.data["employeeForeignName"]}",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                            widget.data["requestDate"] == null
                                ? ""
                                : "${widget.data["requestDate"]}",
                            style: Theme.of(context).textTheme.headline5)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            // widget.data["status"] == "new"
                            //     ? IconButton(
                            //         icon: Icon(
                            //           Icons.delete,
                            //           color: Colors.red,
                            //         ),
                            //         onPressed: () {
                            //           MyTasksController()
                            //               .deleteTask(widget.data['id'])
                            //               .then((value) {
                            //             if (value == true) {
                            //               Fluttertoast.showToast(
                            //                   msg:
                            //                       "This Task Has Been Deleted successfully",
                            //                   toastLength: Toast.LENGTH_SHORT,
                            //                   gravity: ToastGravity.TOP,
                            //                   timeInSecForIosWeb: 1,
                            //                   backgroundColor: Colors.green,
                            //                   textColor: Colors.white,
                            //                   fontSize: 16.0);
                            //               switch (widget.data["status"]) {
                            //                 case "rejected":
                            //                   {
                            //                     MyTasksController()
                            //                         .getTasksList("rejected");
                            //                   }

                            //                   break;
                            //                 case "new":
                            //                   {
                            //                     MyTasksController()
                            //                         .getTasksList("new");
                            //                   }

                            //                   break;
                            //                 case "approved":
                            //                   {
                            //                     MyTasksController()
                            //                         .getTasksList("approved");
                            //                   }

                            //                   break;
                            //               }
                            //             }
                            //           });
                            //         })
                            //     : Container(),

                            widget.data["status"] == "new"
                                ? IconButton(
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      MyTasksController()
                                          .approveOrReject(
                                              widget.data["requestType"],
                                              widget.data['id'],
                                              widget.data['entryId'],
                                              "reject",
                                              context)
                                          .then((value) {
                                        if (value == true) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "This Task Has Been Rejected successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.TOP,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          switch (widget.data["status"]) {
                                            case "rejected":
                                              {
                                                MyTasksController()
                                                    .getTasksList("rejected");
                                              }

                                              break;
                                            case "new":
                                              {
                                                MyTasksController()
                                                    .getTasksList("new");
                                              }

                                              break;
                                            case "approved":
                                              {
                                                MyTasksController()
                                                    .getTasksList("approved");
                                              }

                                              break;
                                          }
                                        }
                                      });
                                    })
                                : Container(),
                            widget.data["status"] == "new"
                                ? IconButton(
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {
                                      MyTasksController()
                                          .approveOrReject(
                                              widget.data["requestType"],
                                              widget.data['id'],
                                              widget.data['entryId'],
                                              "approve",
                                              context)
                                          .then((value) {
                                        if (value == true) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "This Task Has Been Approved successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.TOP,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          switch (widget.data["status"]) {
                                            case "rejected":
                                              {
                                                MyTasksController()
                                                    .getTasksList("rejected");
                                              }

                                              break;
                                            case "new":
                                              {
                                                MyTasksController()
                                                    .getTasksList("new");
                                              }

                                              break;
                                            case "approved":
                                              {
                                                MyTasksController()
                                                    .getTasksList("approved");
                                              }

                                              break;
                                          }
                                        }
                                      });
                                    })
                                : Container(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
