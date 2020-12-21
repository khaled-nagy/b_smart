import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/LoanController.dart';
import 'package:b_smart/src/controllers/PayrollController.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/data/models/LoanModel.dart';
import 'package:b_smart/src/data/models/MonthModel.dart';
import 'package:b_smart/src/data/models/YearModel.dart';
import 'package:b_smart/src/statemanagment/Requests_type.dart';
import 'package:b_smart/src/widgets/TextFormFieldW%20copy.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:date_util/date_util.dart';

class Loan extends StatefulWidget {
  createState() => _LoanState();
}

class _LoanState extends StateMVC<Loan> {
  _LoanState() : super(LoanController()) {
    _loanController = LoanController.con;
  }
  LoanController _loanController;

  LoanModel selectedLoan;
  MonthModel selectEndmonth;
  MonthModel selecStartmonth;
  YearModel selectStartyear;
  YearModel selectEndyear;

  List<MonthModel> monthlist = [
    MonthModel(id: 1, name: "_January".tr()),
    MonthModel(id: 2, name: "_February".tr()),
    MonthModel(id: 3, name: "_March".tr()),
    MonthModel(id: 4, name: "_April".tr()),
    MonthModel(id: 5, name: "_May".tr()),
    MonthModel(id: 6, name: "_June".tr()),
    MonthModel(id: 7, name: "_July".tr()),
    MonthModel(id: 8, name: "_August".tr()),
    MonthModel(id: 9, name: "_Septemper".tr()),
    MonthModel(id: 10, name: "_October".tr()),
    MonthModel(id: 11, name: "_November".tr()),
    MonthModel(id: 12, name: "_December".tr()),
  ];

  String month;
  @override
  void initState() {
    ConstantVarable.requestType = "loan";
    PayrollController().yearsMethod();
    _loanController.getNewRequest("loan");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<LoanRequest>(context);
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height / 1.5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<LoanModel>(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Text(
                            "_Loan_Type".tr(),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        underline: Container(),
                        value: selectedLoan,
                        iconSize: 30,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down),
                        items: _loanController.loanList.map((LoanModel loan) {
                          return DropdownMenuItem<LoanModel>(
                              value: loan,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  EasyLocalization.of(context).locale ==
                                          Locale("en")
                                      ? loan.foreignName
                                      : loan.localName,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ));
                        }).toList(),
                        onChanged: (LoanModel value) {
                          setState(() {
                            selectedLoan = value;
                            LoanController.loanTypeId = value.id;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_Value",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(5)),
                    width: size.width / 2,
                    child: TextFormFieldW(
                      textInputType: TextInputType.number,
                      controller: LoanController.loanValuecontroller,
                      validator: (val) =>
                          UserController().validateAnyFeild(context, val),
                      hintText: "00",
                      searchOrKnow: false,
                      obSecureText: false,
                      changes: (value) {
                        LoanController.loanInstallmentCountcontroller.text = "";
                        LoanController.loanInstallmentValuecontroller.text = "";
                      },
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("_Installment_Count".tr(),
                          style: Theme.of(context).textTheme.headline2)
                      .tr(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(5)),
                    width: size.width / 2,
                    child: TextFormFieldW(
                      textInputType: TextInputType.number,
                      controller: LoanController.loanInstallmentCountcontroller,
                      validator: (val) =>
                          UserController().validateAnyFeild(context, val),
                      hintText: "00",
                      searchOrKnow: false,
                      obSecureText: false,
                      changes: (value) {
                        double installmentValue = double.parse(
                                LoanController.loanValuecontroller.text) /
                            double.parse(LoanController
                                .loanInstallmentCountcontroller.text);

                        LoanController.loanInstallmentValuecontroller.text =
                            installmentValue.toString();

                        setState(() {
                          LoanController.loanEndMonth = 0;
                          LoanController.loanEndYear = 0;
                          selecStartmonth = null;
                          selectStartyear = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("_Installment_Value",
                          style: Theme.of(context).textTheme.headline2)
                      .tr(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(5)),
                    width: size.width / 2,
                    child: TextFormFieldW(
                      textInputType: TextInputType.number,
                      controller: LoanController.loanInstallmentValuecontroller,
                      validator: (val) =>
                          UserController().validateAnyFeild(context, val),
                      hintText: "00",
                      searchOrKnow: false,
                      obSecureText: false,
                      changes: (value) {
                        double installmentCount = double.parse(
                                LoanController.loanValuecontroller.text) /
                            double.parse(LoanController
                                .loanInstallmentValuecontroller.text);

                        LoanController.loanInstallmentCountcontroller.text =
                            installmentCount.toString();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_Start_Month",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                      width: size.width / 2,
                      child: Card(
                        child: DropdownButton<MonthModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "_Select_Month",
                                style: Theme.of(context).textTheme.headline5,
                              ).tr(),
                            ),
                            underline: Container(),
                            value: selecStartmonth,
                            iconSize: 30,
                            isExpanded: true,
                            icon: Padding(
                                padding: const EdgeInsets.only(),
                                child: Icon(Icons.arrow_drop_down)),
                            items: monthlist.map((MonthModel month) {
                              return DropdownMenuItem<MonthModel>(
                                  value: month,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      month.name,
                                      style:
                                          Theme.of(context).textTheme.headline,
                                    ),
                                  ));
                            }).toList(),
                            onChanged: (MonthModel value) {
                              setState(() {
                                selecStartmonth = value;
                                LoanController.loanStartMonth = value.id;

                                LoanController.loanEndMonth = 0;
                                LoanController.loanEndYear = 0;

                                selectStartyear = null;
                              });
                            }),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_Start_Year",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                      width: size.width / 2,
                      child: Card(
                        child: DropdownButton<YearModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "_Select_Year",
                                style: Theme.of(context).textTheme.headline5,
                              ).tr(),
                            ),
                            underline: Container(),
                            value: selectStartyear,
                            iconSize: 30,
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down),
                            items: PayrollController()
                                .yearList
                                .map((YearModel year) {
                              return DropdownMenuItem<YearModel>(
                                  value: year,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      year.name,
                                      style:
                                          Theme.of(context).textTheme.headline,
                                    ),
                                  ));
                            }).toList(),
                            onChanged: (YearModel value) {
                              setState(() {
                                selectStartyear = value;
                                LoanController.loanStartYear =
                                    int.parse(value.name);
                                int sum = int.parse(LoanController
                                        .loanInstallmentCountcontroller.text) +
                                    LoanController.loanStartMonth;

                                if (sum <= 12) {
                                  LoanController.loanEndMonth = sum - 1;
                                  LoanController.loanEndYear =
                                      LoanController.loanStartYear;
                                } else if (sum > 12) {
                                  int sub = sum - 12;
                                  LoanController.loanEndMonth = sub - 1;
                                  LoanController.loanEndYear =
                                      LoanController.loanStartYear + 1;
                                } else if (sum > 24) {
                                  int sub = sum - 24;
                                  LoanController.loanEndMonth = sub - 1;
                                  LoanController.loanEndYear =
                                      LoanController.loanStartYear + 2;
                                } else if (sum > 36) {
                                  int sub = sum - 36;
                                  LoanController.loanEndMonth = sub - 1;
                                  LoanController.loanEndYear =
                                      LoanController.loanStartYear + 3;
                                } else if (sum > 48) {
                                  int sub = sum - 48;
                                  LoanController.loanEndMonth = sub - 1;
                                  LoanController.loanEndYear =
                                      LoanController.loanStartYear + 4;
                                } else if (sum > 60) {
                                  int sub = sum - 60;
                                  LoanController.loanEndMonth = sub - 1;
                                  LoanController.loanEndYear =
                                      LoanController.loanStartYear + 5;
                                }
                              });
                            }),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_End_Month",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                      width: size.width / 2,
                      child: Card(
                        child: Center(
                          child: Text(
                            LoanController.loanEndMonth != 0
                                ? "${DateUtil().month(LoanController.loanEndMonth).toString()}"
                                : "",
                            style: Theme.of(context).textTheme.headline5,
                          ).tr(),
                        ),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_End_Year",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                      width: size.width / 2,
                      child: Card(
                        child: Center(
                          child: Text(
                            LoanController.loanEndYear != 0
                                ? "${LoanController.loanEndYear}"
                                : "",
                            style: Theme.of(context).textTheme.headline5,
                          ).tr(),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
