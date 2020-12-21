import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/PayrollController.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/controllers/VacationBalanceController.dart';
import 'package:b_smart/src/controllers/VacationController.dart';
import 'package:b_smart/src/data/models/VacationModel.dart';
import 'package:b_smart/src/data/models/YearModel.dart';
import 'package:b_smart/src/statemanagment/Requests_type.dart';
import 'package:b_smart/src/widgets/TextFormFieldW%20copy.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class VacationBalance extends StatefulWidget {
  createState() => _VacationBalanceState();
}

class _VacationBalanceState extends StateMVC<VacationBalance> {
  _VacationBalanceState() : super(VacationBalanceController()) {
    _vacationBalanceController = VacationBalanceController.con;
  }

  VacationBalanceController _vacationBalanceController;

  List<YearModel> yearList = [
    YearModel(id: 1, name: "2010"),
    YearModel(id: 2, name: "2011"),
    YearModel(id: 3, name: "2012"),
    YearModel(id: 4, name: "2013"),
    YearModel(id: 5, name: "2014"),
    YearModel(id: 6, name: "2015"),
    YearModel(id: 7, name: "2016"),
    YearModel(id: 8, name: "2017"),
    YearModel(id: 9, name: "2018"),
    YearModel(id: 10, name: "2019"),
    YearModel(id: 11, name: "2020"),
    YearModel(id: 12, name: "2021"),
  ];
  YearModel selectyear;
  VacationModel selectID;
  @override
  void initState() {
    ConstantVarable.requestType = "vacationBalanceAdjustment";
    _vacationBalanceController.getNewRequest("vacationBalanceAdjustment");
    PayrollController().yearsMethod();
    super.initState();
  }

  Widget build(BuildContext context) {
    final prov = Provider.of<VacationBalanceRequest>(context);

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Container(
                  child: DropdownButton<VacationModel>(
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "_Vacation_Balance_Request".tr(),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    underline: Container(),
                    value: selectID,
                    iconSize: 30,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down),
                    items: VacationController()
                        .vacationList
                        .map((VacationModel vacationBalance) {
                      return DropdownMenuItem<VacationModel>(
                          value: vacationBalance,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              vacationBalance.foreignName,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ));
                    }).toList(),
                    onChanged: (VacationModel value) {
                      setState(() {
                        selectID = value;
                        VacationBalanceController.vacationBalanceTypeId =
                            value.id;
                      });
                    },
                  ),
                ),
              ),
              Container(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_Year",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: DropdownButton<YearModel>(
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("_Select_Year",
                                style: Theme.of(context).textTheme.headline5)
                            .tr(),
                      ),
                      iconSize: 30.0,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Icon(Icons.arrow_drop_down),
                      ),
                      isExpanded: true,
                      value: selectyear,
                      items: PayrollController().yearList.map((year) {
                        return DropdownMenuItem<YearModel>(
                          child: Text(year.name),
                          value: year,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectyear = value;
                          VacationBalanceController.vacationBalanceadjustYear =
                              int.parse(value.name);
                        });
                      },
                    ),
                  )
                ],
              ),
              Container(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_Value",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormFieldW(
                      textInputType: TextInputType.number,
                      controller: VacationBalanceController
                          .vacationBalanceadjustValueVontroller,
                      validator: (val) =>
                          UserController().validateAnyFeild(context, val),
                      hintText: "00",
                      searchOrKnow: false,
                      obSecureText: false,
                    ),
                  )
                ],
              ),
              Container(
                height: 40,
              ),
              Container(
                height: 80.0,
                child: ListTile(
                  leading: Text(
                    "_Notes",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  title: TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller: VacationBalanceController
                        .vacationBalanceadjustNotesVontroller,
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
      ),
    );
  }
}
