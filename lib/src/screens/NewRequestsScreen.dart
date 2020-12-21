import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/AssignmentController.dart';
import 'package:b_smart/src/controllers/LoanController.dart';
import 'package:b_smart/src/controllers/PayrollController.dart';
import 'package:b_smart/src/controllers/PermissionController.dart';
import 'package:b_smart/src/controllers/TermenationController.dart';
import 'package:b_smart/src/controllers/VacationBalanceController.dart';
import 'package:b_smart/src/controllers/VacationController.dart';
import 'package:b_smart/src/screens/AssignmentRequestScreen.dart';
import 'package:b_smart/src/screens/LoanRequestScreen.dart';
import 'package:b_smart/src/screens/PayrollAdgustmentRequestScreen.dart';
import 'package:b_smart/src/screens/PermissionRequestScreen.dart';
import 'package:b_smart/src/screens/TermenationRequestScreen.dart';
import 'package:b_smart/src/screens/VacationBalanceRequestScreen.dart';
import 'package:b_smart/src/screens/VacationRequestScreen.dart';
import 'package:b_smart/src/statemanagment/selectRequestType.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/RequestsDropDown.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class NewRequests extends StatefulWidget {
  @override
  createState() => NewRequestsView();
}

class NewRequestsView extends StateMVC<NewRequests> {
  NewRequestsView() : super(PayrollController()) {
    _payrollController = PayrollController.con;
  }
  PayrollController _payrollController;

  @override
  void initState() {
    VacationController().getAllLookups("vacation-types");
    PermissionController().getAllLookups("permission-types");
    TerminationController().getAllLookups("termination-types");
    LoanController().getAllLookups("loan-types");
    AssignmentController().getAllLookups("locations");
    AssignmentController().getAllLookups("departments");
    AssignmentController().getAllLookups("positions");
    _payrollController.getAllLookups("payitems");
    VacationBalanceController().getAllLookups("vacation-groups");
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SelectRequest>(context);
    Widget requestFormTypeW() {
      switch (prov.requesttype) {
        case "":
          {
            return Container();
          }

          break;
        case "vacation-types":
          {
            return Vacation();
          }

          break;
        case "permission-types":
          {
            return Permission();
          }

          break;
        case "Assignment Change Request":
          {
            return Assignment();
          }

          break;
        case "Vacation Balance Adjustment":
          {
            return VacationBalance();
          }

          break;
        case "termination-types":
          {
            return Termination();
          }

          break;
        case "loan-types":
          {
            return Loan();
          }

          break;

        case "Payroll Adjustment Request":
          {
            return PayrollAdjustment();
          }

          break;
      }
    }

    return Scaffold(
      appBar: appbar(
        context: context,
      ),
      body: SingleChildScrollView(
        child: new Column(
          children: [
            Padding(padding: const EdgeInsets.all(10.0), child: Container()),
            SelectRequestType(),
            SizedBox(
              height: 20.0,
            ),
            requestFormTypeW(),
            // prov.requesttype == "vacation-types"
            //     ? Vacation()
            //     : prov.requesttype == "permission-types"
            //         ? Permission()
            //         : prov.requesttype == "Assignment Change Request"
            //             ? Assignment()
            //             : prov.requesttype == "Vacation Balance Adjustment"
            //                 ? VacationBalance()
            //                 : prov.requesttype == "termination-types"
            //                     ? Termination()
            //                     : prov.requesttype == "loan-types"
            //                         ? Loan()
            //                         : prov.requesttype ==
            //                                 "Payroll Adjustment Request"
            //                             ? PayrollAdjustment()
            //                             : Container()
          ],
        ),
      ),
      bottomNavigationBar: prov.requesttype != ""
          ? isLoading == false
              ? Container(
                  color: Theme.of(context).backgroundColor,
                  child: FlatButton(
                    onPressed: () {
                      switch (ConstantVarable.requestType) {
                        case "vacation":
                          {
                            if (VacationController.vacationTypeId == 0) {
                              Fluttertoast.showToast(
                                  msg: "please choose you vacation type",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (VacationController
                                    .vacationNumberController.text ==
                                "") {
                              Fluttertoast.showToast(
                                  msg: "please enter your number of days",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (VacationController
                                    .vacationStartCalender ==
                                null) {
                              Fluttertoast.showToast(
                                  msg: "please choose you start Date ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (VacationController.vacationEndCalender ==
                                null) {
                              Fluttertoast.showToast(
                                  msg: "please choose you End Date ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              VacationController()
                                  .postVacation(
                                      "vacation",
                                      VacationController.vacationTypeId,
                                      VacationController
                                          .vacationNumberController.text,
                                      VacationController.vacationStartCalender
                                          .toString(),
                                      VacationController.vacationEndCalender
                                          .toString(),
                                      VacationController.returnDate,
                                      VacationController
                                          .vacationNotesController.text)
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Request submitted successfully",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.pop(context);
                                }
                              });
                            }
                          }

                          break;
                        case "permission":
                          {
                            setState(() {
                              isLoading = true;
                            });
                            if (PermissionController.permissionTypeId == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your Permission type",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (PermissionController.permissionDate ==
                                "") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your date ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (PermissionController
                                        .permissionDurationController.text ==
                                    "" ||
                                PermissionController
                                        .permissionDurationController.text ==
                                    "0") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please enter your duration ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (PermissionController
                                    .permissionStartTime ==
                                "00") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose you start Time ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (PermissionController.permissionEndTime ==
                                "00") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose you End Time ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              PermissionController()
                                  .postPermission(
                                      "permission",
                                      PermissionController.permissionTypeId,
                                      PermissionController.permissionDate,
                                      PermissionController
                                          .permissionDurationController.text,
                                      PermissionController.permissionStartTime,
                                      PermissionController.permissionEndTime,
                                      PermissionController
                                          .permissionNotesController.text)
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Request submitted successfully",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.pop(context);
                                }
                              });
                            }
                          }

                          break;
                        case "termination":
                          {
                            setState(() {
                              isLoading = true;
                            });
                            if (TerminationController.terminationTypeId == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your Termination Type ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (TerminationController
                                    .terminasionLastWorkinDayCalender ==
                                "") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your Last Work Day ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (TerminationController
                                    .terminasionNotescontroller.text ==
                                "") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please enter your notes ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              TerminationController()
                                  .postTermination(
                                      "termination",
                                      TerminationController.terminationTypeId,
                                      TerminationController
                                          .terminasionLastWorkinDayCalender,
                                      TerminationController
                                          .terminasionNotescontroller.text)
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Request submitted successfully",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.pop(context);
                                }
                              });
                            }
                          }

                          break;
                        case "loan":
                          {
                            setState(() {
                              isLoading = true;
                            });
                            if (LoanController.loanTypeId == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your loan type",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (LoanController
                                    .loanValuecontroller.text ==
                                "") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please enter your value ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (LoanController
                                    .loanInstallmentCountcontroller.text ==
                                "") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please enter your Installment Count ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (LoanController.loanStartMonth == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose you start month ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (LoanController.loanEndMonth == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose you End Month ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (LoanController
                                    .loanInstallmentValuecontroller.text ==
                                "") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please enter you Installment Value",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (LoanController.loanStartYear == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your start year",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (LoanController.loanEndYear == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your end year",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              int installmentCount = int.parse(LoanController
                                  .loanInstallmentCountcontroller.text);
                              LoanController()
                                  .postLoan(
                                      "loan",
                                      LoanController.loanTypeId,
                                      double.parse(LoanController
                                          .loanValuecontroller.text),
                                      installmentCount,
                                      double.parse(LoanController
                                          .loanInstallmentValuecontroller.text),
                                      int.parse(LoanController.loanStartMonth
                                          .toString()),
                                      int.parse(LoanController.loanEndMonth
                                          .toString()),
                                      LoanController.loanStartYear,
                                      LoanController.loanEndYear)
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Request submitted successfully",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.pop(context);
                                }
                              });
                            }
                          }

                          break;
                        case "assignmentChange":
                          {
                            setState(() {
                              isLoading = true;
                            });
                            if (AssignmentController.locationId == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your Location ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (AssignmentController.departmentId == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your Department ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (AssignmentController.positionId == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your position ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              AssignmentController()
                                  .postAssignmentChange(
                                      "assignmentChange",
                                      AssignmentController.locationId,
                                      AssignmentController.departmentId,
                                      AssignmentController.positionId)
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Request submitted successfully",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.pop(context);
                                }
                              });
                            }
                          }

                          break;
                        case "vacationBalanceAdjustment":
                          {
                            setState(() {
                              isLoading = true;
                            });
                            if (VacationBalanceController
                                    .vacationBalanceTypeId ==
                                0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your Balance Type ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (VacationBalanceController
                                    .vacationBalanceadjustYear ==
                                0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your balance year ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (VacationBalanceController
                                    .vacationBalanceadjustValueVontroller
                                    .text ==
                                "") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please enter your value ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (VacationBalanceController
                                    .vacationBalanceadjustNotesVontroller
                                    .text ==
                                "") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please enter your notes ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              VacationBalanceController()
                                  .postVacationBalance(
                                      "vacationBalanceAdjustment",
                                      VacationBalanceController
                                          .vacationBalanceTypeId,
                                      VacationBalanceController
                                          .vacationBalanceadjustYear,
                                      double.parse(VacationBalanceController
                                          .vacationBalanceadjustValueVontroller
                                          .text),
                                      VacationBalanceController
                                          .vacationBalanceadjustNotesVontroller
                                          .text)
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Request submitted successfully",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.pop(context);
                                }
                              });
                            }
                          }

                          break;
                        case "payrollAdjustment":
                          {
                            setState(() {
                              isLoading = true;
                            });
                            if (PayrollController.payItemTypeId == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your pay item type",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (PayrollController.payStartMonth == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose you start month ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (PayrollController.payEndMonth == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose you End Time ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (PayrollController.payStartYear == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your start year",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (PayrollController.payEndYear == 0) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please choose your end year",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (PayrollController
                                    .payrollValueController.text ==
                                "") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please enter your value ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (PayrollController
                                    .payrollNotesController.text ==
                                "") {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "please enter your notes ",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              _payrollController
                                  .postPayRoll(
                                "payrollAdjustment",
                                PayrollController.payItemTypeId,
                                PayrollController.payStartMonth,
                                PayrollController.payEndMonth,
                                int.parse(PayrollController.payStartYearString),
                                int.parse(PayrollController.payEndYearString),
                                double.parse(PayrollController
                                    .payrollValueController.text),
                                PayrollController.payrollNotesController.text,
                              )
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Request submitted successfully",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.pop(context);
                                }
                              });
                            }
                          }

                          break;
                      }
                    },
                    child: Text(
                      "_Save_Request",
                      style: Theme.of(context).textTheme.headline1,
                    ).tr(),
                  ),
                )
              : Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.white,
            ),
    );
  }
}
