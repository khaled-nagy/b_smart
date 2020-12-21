import 'package:b_smart/src/screens/AssignmentDetailsScreen.dart';
import 'package:b_smart/src/screens/BalanceDetailsScreen.dart';
import 'package:b_smart/src/screens/LoanDetailsScreen.dart';
import 'package:b_smart/src/screens/PayrollDetailsScreen.dart';
import 'package:b_smart/src/screens/PermissionDetailsScreen.dart';
import 'package:b_smart/src/screens/TerminationDetailsScreen.dart';
import 'package:b_smart/src/screens/VacationDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class RequestCard extends StatefulWidget {
  final Map<String, dynamic> data;
  RequestCard({this.data});
  @override
  _RequestCardState createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    Color stateColor;
    switch (widget.data["status"]) {
      case "new":
        {
          stateColor = Theme.of(context).backgroundColor;
        }
        break;
      case "approved":
        {
          stateColor = Colors.green;
        }
        break;
      case "rejected":
        {
          stateColor = Colors.red;
        }
        break;
      case "inProgress":
        {
          stateColor = Colors.blue;
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
                      width: widget.data["status"].toString().length > 8
                          ? MediaQuery.of(context).size.width / 3.8
                          : MediaQuery.of(context).size.width / 4.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: stateColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            widget.data["status"] == null
                                ? ""
                                : "${widget.data["status"]}",
                            style: Theme.of(context).textTheme.headline3,
                          ).tr(),
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
