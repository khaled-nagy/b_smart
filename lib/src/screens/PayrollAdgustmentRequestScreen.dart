import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/PayrollController.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/data/models/MonthModel.dart';
import 'package:b_smart/src/data/models/PayItemModel.dart';
import 'package:b_smart/src/data/models/YearModel.dart';
import 'package:b_smart/src/widgets/TextFormFieldW%20copy.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:easy_localization/easy_localization.dart';

class PayrollAdjustment extends StatefulWidget {
  createState() => _PayrollAdjustmentState();
}

class _PayrollAdjustmentState extends StateMVC<PayrollAdjustment> {
  _PayrollAdjustmentState() : super(PayrollController()) {
    _payrollController = PayrollController.con;
  }
  PayrollController _payrollController;

  PayItemModel selectpayItem;
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

  @override
  void initState() {
    ConstantVarable.requestType = "payrollAdjustment";
    _payrollController.getNewRequest("payrollAdjustment");
    _payrollController.yearsMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: size.width * 0.9,
        child: Column(
          children: [
            Container(
              height: 65.0,
              child: ListTile(
                  leading: Text(
                    "_Pay_Item",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  title: Container(
                    child: DropdownButton<PayItemModel>(
                      iconSize: 30,
                      icon: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Icon(Icons.arrow_drop_down)),
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "_Select_Item",
                          style: Theme.of(context).textTheme.headline5,
                        ).tr(),
                      ),
                      value: selectpayItem,
                      isExpanded: true,
                      items: _payrollController.payItemList
                          .map((PayItemModel payItem) {
                        return DropdownMenuItem<PayItemModel>(
                          child: Text(
                            EasyLocalization.of(context).locale == Locale("en")
                                ? payItem.foreignName
                                : payItem.localName,
                          ),
                          value: payItem,
                        );
                      }).toList(),
                      onChanged: (PayItemModel value) {
                        setState(() {
                          selectpayItem = value;
                          PayrollController.payItemTypeId = value.id;
                        });
                      },
                    ),
                  )),
            ),
            Container(
                height: 65.0,
                child: ListTile(
                    leading: Text(
                      "_Value",
                      style: Theme.of(context).textTheme.headline2,
                    ).tr(),
                    title: Container(
                      child: TextFormFieldW(
                        textInputType: TextInputType.number,
                        controller: PayrollController.payrollValueController,
                        validator: (val) =>
                            UserController().validateAnyFeild(context, val),
                        hintText: "00",
                        searchOrKnow: false,
                        obSecureText: false,
                      ),
                    ))),
            Container(
              height: 65.0,
              child: ListTile(
                  leading: Text(
                    "_Start_Month",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  title: Container(
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
                            icon: Icon(Icons.arrow_drop_down),
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
                                PayrollController.payStartMonth = value.id;
                              });
                            }),
                      ))),
            ),
            Container(
              height: 65.0,
              child: ListTile(
                  leading: Text(
                    "_Start_Year",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  title: Container(
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
                            items: _payrollController.yearList
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
                                PayrollController.payStartYear = value.id;
                                PayrollController.payStartYearString =
                                    value.name;
                              });
                            }),
                      ))),
            ),
            Container(
                height: 65.0,
                child: ListTile(
                  leading: Text(
                    "_End_Month",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  title: Container(
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
                            value: selectEndmonth,
                            iconSize: 30,
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down),
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
                                PayrollController.payEndMonth = value.id;
                                if (PayrollController.payEndMonth <
                                    PayrollController.payStartMonth) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "please Choose end month after start month",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  selectEndmonth = value;
                                  PayrollController.payEndMonth = value.id;
                                }
                              });
                            }),
                      )),
                )),
            Container(
              height: 65.0,
              child: ListTile(
                  leading: Text(
                    "_End_Year",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  title: Container(
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
                            value: selectEndyear,
                            iconSize: 30,
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down),
                            items: _payrollController.yearList
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
                                PayrollController.payEndYear = value.id;
                                if (PayrollController.payEndYear <
                                    PayrollController.payStartYear) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "please Choose end year after start year",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  selectEndyear = value;
                                  PayrollController.payEndYear = value.id;
                                  PayrollController.payEndYearString =
                                      value.name;
                                }
                              });
                            }),
                      ))),
            ),
            Container(
              height: 65.0,
              child: ListTile(
                leading: Text(
                  "_Notes",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                title: TextFormFieldW(
                  textInputType: TextInputType.text,
                  controller: PayrollController.payrollNotesController,
                  validator: (val) =>
                      UserController().validateAnyFeild(context, val),
                  hintText: "_Add_notes_Here".tr(),
                  searchOrKnow: false,
                  obSecureText: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
