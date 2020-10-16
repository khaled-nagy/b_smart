import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/data/models/DepartmentModel.dart';
import 'package:b_smart/src/data/models/LoanTypeModel.dart';
import 'package:b_smart/src/data/models/LocationModel.dart';
import 'package:b_smart/src/data/models/MonthModel.dart';
import 'package:b_smart/src/data/models/PayItemModel.dart';
import 'package:b_smart/src/data/models/PostionModel.dart';
import 'package:b_smart/src/data/models/TerminasiontypeModel.dart';
import 'package:b_smart/src/data/models/VacationBalanceIDModel.dart';
import 'package:b_smart/src/data/models/VacationIdModel.dart';
import 'package:b_smart/src/data/models/YearModel.dart';
import 'package:b_smart/src/statemanagment/Requests_type.dart';
import 'package:b_smart/src/widgets/TextFormFieldW%20copy.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;

// forms types

class Vacation extends StatefulWidget {
  @override
  _VacationState createState() => _VacationState();
}

class _VacationState extends State<Vacation> {
  List<VacationIdModel> vacationidList = [
    VacationIdModel(id: "1", name: "10"),
    VacationIdModel(id: "2", name: "20"),
    VacationIdModel(id: "3", name: "30"),
    VacationIdModel(id: "4", name: "40"),
    VacationIdModel(id: "5", name: "50"),
    VacationIdModel(id: "6", name: "60"),
  ];
  VacationIdModel selectedId;
  @override
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<VacationRequest>(context);
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height / 1.4,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    "_Vacation_Type_ID",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                      width: size.width / 2.3,
                      child: DropdownButton<VacationIdModel>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "_vacation_ID",
                              style: Theme.of(context).textTheme.headline5,
                            ).tr(),
                          ),
                          underline: Container(),
                          value: selectedId,
                          iconSize: 30,
                          icon: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Icon(Icons.arrow_drop_down)),
                          items: vacationidList.map((VacationIdModel year) {
                            return DropdownMenuItem<VacationIdModel>(
                                value: year,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    year.name,
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (VacationIdModel value) {
                            setState(() {
                              selectedId = value;
                            });
                          }))
                ],
              ),
              Container(
                  child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("_Numers_of_Days",
                      style: Theme.of(context).textTheme.headline2).tr(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: new Text(prov.counter.toString()),
                  ),
                  Container(
                    child: Row(
                      children: [
                        new IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            prov.discreament();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            prov.increament();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_start_Date",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                    width: size.width / 2,
                    child: DateTimePicker(
                      cursorColor: Theme.of(context).backgroundColor,
                      initialValue: DateTime.now().toString(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2021),
                      icon: Icon(Icons.calendar_today_rounded),
                      dateLabelText: '',
                      onChanged: (val) {
                        print(val);

                        ConstantVarable.vacationStartCalender = val;
                      },
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) {
                        print(val);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_End_Date",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                    width: size.width / 2,
                    child: DateTimePicker(
                      cursorColor: Theme.of(context).backgroundColor,

                      initialValue: ConstantVarable.vacationStartCalender,
                      firstDate: DateTime(
                          ConstantVarable.vacationStartCalender == null
                              ? 2000
                              : int.parse(ConstantVarable.vacationStartCalender
                                  .substring(0, 3))),
                      lastDate: DateTime(2021),
                      icon: Icon(Icons.calendar_today_rounded),
                      // controller: ConstantVarable.vacationStartCalender,
                      dateLabelText: '',
                      onChanged: (val) {
                        print(val);

                        ConstantVarable.vacationStartCalender = val;
                      },
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) {
                        print(val);
                      },
                    ),
                  ),
                ],
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
                    controller: ConstantVarable.vacationNotesController,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "_Add_notes_Here".tr(),
                    searchOrKnow: false,
                    obSecureText: false,
                    timeOrNo: true,
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

class Permission extends StatefulWidget {
  @override
  _PermissionState createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  List<VacationIdModel> vacationidList = [
    VacationIdModel(
      id: "1",
      name: "10",
    ),
    VacationIdModel(
      id: "2",
      name: "20",
    ),
    VacationIdModel(
      id: "3",
      name: "30",
    )
  ];
  VacationIdModel selectedId;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<PermissionRequest>(context);
    return SingleChildScrollView(
      child: Container(
        height: size.height / 1.5,
        width: size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  "_permission_type_id",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                  width: size.width / 2.3,
                  child: DropdownButton(
                    iconSize: 30,
                    icon: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Icon(Icons.arrow_drop_down)),
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Permission_ID",
                        style: Theme.of(context).textTheme.headline5,
                      ).tr(),
                    ),
                    value: selectedId,
                    isExpanded: true,
                    items: vacationidList.map((VacationIdModel vacationid) {
                      return DropdownMenuItem<VacationIdModel>(
                        child: Text(vacationid.name),
                        value: vacationid,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedId = value;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_Premission_Date",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                  width: size.width / 2,
                  child: DateTimePicker(
                    cursorColor: Theme.of(context).backgroundColor,

                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2021),
                    icon: Icon(Icons.calendar_today_rounded),
                    // controller: ConstantVarable.vacationStartCalender,
                    dateLabelText: '',
                    onChanged: (val) {
                      print(val);

                      ConstantVarable.vacationStartCalender = val;
                    },
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) {
                      print(val);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("_Duration", style: Theme.of(context).textTheme.headline2).tr(),
                SizedBox(
                  width: size.width * 0.040,
                ),
                Text(prov.durationCounter.toString()),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    prov.durationdicreasent();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_up),
                  onPressed: () {
                    prov.durationIncaresment();
                  },
                ),
                Text("_Minute").tr()
              ],
            ),
            Row(
              children: [
                Text(
                  "_start_time",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                  width: size.width / 2,
                  child: TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller: ConstantVarable.permissionStartDateController,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "00 : 00",
                    searchOrKnow: false,
                    obSecureText: false,
                    timeOrNo: true,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "_end_Time",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                  width: size.width / 2,
                  child: TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller: ConstantVarable.permissionEndDateController,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "00 : 00",
                    searchOrKnow: false,
                    obSecureText: false,
                    timeOrNo: true,
                  ),
                ),
              ],
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
                  controller: ConstantVarable.permissionNotesController,
                  validator: (val) =>
                      UserController().validateAnyFeild(context, val),
                  hintText: "_Add_notes_Here".tr(),
                  searchOrKnow: false,
                  obSecureText: false,
                  timeOrNo: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Assignment extends StatefulWidget {
  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  List<LocationModel> locationList = [
    LocationModel(id: "1", name: "10"),
    LocationModel(id: "2", name: "20"),
    LocationModel(id: "3", name: "30"),
    LocationModel(id: "4", name: "40"),
    LocationModel(id: "5", name: "50"),
    LocationModel(id: "6", name: "60"),
  ];
  LocationModel selectlocation;
  List<DepartmentModel> departmentList = [
    DepartmentModel(id: "1", name: "10"),
    DepartmentModel(id: "2", name: "20"),
    DepartmentModel(id: "3", name: "30"),
    DepartmentModel(id: "4", name: "40"),
    DepartmentModel(id: "5", name: "50"),
    DepartmentModel(id: "6", name: "60"),
  ];
  DepartmentModel selectDepartment;
  List<PositionModel> positionList = [
    PositionModel(id: "1", name: "10"),
    PositionModel(id: "2", name: "20"),
    PositionModel(id: "3", name: "30"),
    PositionModel(id: "4", name: "40"),
    PositionModel(id: "5", name: "50"),
    PositionModel(id: "6", name: "60"),
  ];
  PositionModel selectPosition;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<AssignmentChangeRequest>(context);
    return SingleChildScrollView(
      child: Container(
        height: 470,
        width: size.width * 0.9,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_New_LOcation",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                    width: size.width / 2,
                    child: Card(
                      child: DropdownButton<LocationModel>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "_Location",
                              style: Theme.of(context).textTheme.headline5,
                            ).tr(),
                          ),
                          underline: Container(),
                          value: selectlocation,
                          iconSize: 30,
                          isExpanded: true,
                          icon: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Icon(Icons.arrow_drop_down)),
                          items: locationList.map((LocationModel location) {
                            return DropdownMenuItem<LocationModel>(
                                value: location,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    location.name,
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (LocationModel value) {
                            setState(() {
                              selectlocation = value;
                            });
                          }),
                    )),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_New_Department",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                    width: size.width / 2,
                    child: Card(
                      child: DropdownButton<DepartmentModel>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "_Department",
                              style: Theme.of(context).textTheme.headline5,
                            ).tr(),
                          ),
                          underline: Container(),
                          value: selectDepartment,
                          iconSize: 30,
                          isExpanded: true,
                          icon: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Icon(Icons.arrow_drop_down)),
                          items: departmentList.map((DepartmentModel year) {
                            return DropdownMenuItem<DepartmentModel>(
                                value: year,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    year.name,
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (DepartmentModel value) {
                            setState(() {
                              selectDepartment = value;
                            });
                          }),
                    )),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_New_Postion",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                    width: size.width / 2,
                    child: Card(
                      child: DropdownButton<PositionModel>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "_Position",
                              style: Theme.of(context).textTheme.headline5,
                            ).tr(),
                          ),
                          underline: Container(),
                          value: selectPosition,
                          iconSize: 30,
                          isExpanded: true,
                          icon: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Icon(Icons.arrow_drop_down)),
                          items: positionList.map((PositionModel year) {
                            return DropdownMenuItem<PositionModel>(
                                value: year,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    year.name,
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (PositionModel value) {
                            setState(() {
                              selectPosition = value;
                            });
                          }),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VacationBalance extends StatefulWidget {
  @override
  _VacationBalanceState createState() => _VacationBalanceState();
}

class _VacationBalanceState extends State<VacationBalance> {
  @override
  List<VacationBalanceIdModel> vacationbalanceList = [
    VacationBalanceIdModel(id: "1", name: "01"),
    VacationBalanceIdModel(id: "2", name: "02"),
    VacationBalanceIdModel(id: "3", name: "03"),
    VacationBalanceIdModel(id: "4", name: "04"),
  ];
  List<YearModel> yearList = [
    YearModel(id: "1", name: "2010"),
    YearModel(id: "2", name: "2011"),
    YearModel(id: "3", name: "2012"),
    YearModel(id: "4", name: "2013"),
    YearModel(id: "5", name: "2014"),
    YearModel(id: "6", name: "2015"),
    YearModel(id: "7", name: "2016"),
    YearModel(id: "8", name: "2017"),
    YearModel(id: "9", name: "2018"),
    YearModel(id: "10", name: "2019"),
    YearModel(id: "11", name: "2020"),
    YearModel(id: "12", name: "2021"),
  ];
  YearModel selectyear;
  VacationBalanceIdModel selectID;
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
              Container(
                height: 80.0,
                child: ListTile(
                    leading: Text(
                      "_Vacation_Type_ID",
                      style: Theme.of(context).textTheme.headline2,
                    ).tr(),
                    title: Container(
                      child: DropdownButton(
                        hint: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("_vacation_ID",
                              style: Theme.of(context).textTheme.headline5).tr(),
                        ),
                        iconSize: 30.0,
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                        isExpanded: true,
                        value: prov.vacationBalanceID,
                        items: vacationbalanceList.map((vacation) {
                          return DropdownMenuItem<VacationBalanceIdModel>(
                            child: Text(vacation.name),
                            value: vacation,
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectID = value;
                        },
                      ),
                    )),
              ),
              Container(
                height: 80.0,
                child: ListTile(
                    leading: Text(
                      "_Year",
                      style: Theme.of(context).textTheme.headline2,
                    ).tr(),
                    title: Container(
                      child: DropdownButton(
                        hint: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("_Select_Year",
                              style: Theme.of(context).textTheme.headline5).tr(),
                        ),
                        iconSize: 30.0,
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                        isExpanded: true,
                        value: selectyear,
                        items: yearList.map((year) {
                          return DropdownMenuItem<YearModel>(
                            child: Text(year.name),
                            value: year,
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectyear = value;
                        },
                      ),
                    )),
              ),
              Container(
                height: 80.0,
                child: ListTile(
                    leading: Text(
                      "_Value",
                      style: Theme.of(context).textTheme.headline2,
                    ).tr(),
                    title: Container(
                      child: TextFormFieldW(
                        textInputType: TextInputType.text,
                        controller: ConstantVarable
                            .vacationBalanceadjustValueVontroller,
                        validator: (val) =>
                            UserController().validateAnyFeild(context, val),
                        hintText: "00",
                        searchOrKnow: false,
                        obSecureText: false,
                        timeOrNo: true,
                      ),
                    )),
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
                    controller:
                        ConstantVarable.vacationBalanceadjustNotesVontroller,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "_Add_notes_Here".tr(),
                    searchOrKnow: false,
                    obSecureText: false,
                    timeOrNo: true,
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

class Termination extends StatefulWidget {
  @override
  _TerminationState createState() => _TerminationState();
}

class _TerminationState extends State<Termination> {
  List<TerminationTypeModel> terminationTypeList = [
    TerminationTypeModel(id: "1", name: "01"),
    TerminationTypeModel(id: "2", name: "02"),
    TerminationTypeModel(id: "3", name: "03"),
    TerminationTypeModel(id: "4", name: "04"),
  ];
  TerminationTypeModel selecttype;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<TermnisionRequest>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: size.height / 1.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_Termination_Type",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                  width: size.width / 2,
                  child: DropdownButton(
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("_select_Type",
                          style: Theme.of(context).textTheme.headline5).tr(),
                    ),
                    iconSize: 30.0,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Icon(Icons.arrow_drop_down),
                    ),
                    isExpanded: true,
                    value: selecttype,
                    items: terminationTypeList.map((year) {
                      return DropdownMenuItem<TerminationTypeModel>(
                        child: Text(year.name),
                        value: year,
                      );
                    }).toList(),
                    onChanged: (value) {
                      selecttype = value;
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_last_Working_Day",
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                Container(
                  width: size.width / 2,
                  child: DateTimePicker(
                    cursorColor: Theme.of(context).backgroundColor,

                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2021),
                    icon: Icon(Icons.calendar_today_rounded),
                    // controller: ConstantVarable.vacationStartCalender,
                    dateLabelText: '',
                    onChanged: (val) {
                      print(val);

                      ConstantVarable.vacationStartCalender = val;
                    },
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) {
                      print(val);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "_Notes".tr(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                Container(
                  width: size.width / 1.5,
                  child: TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller: ConstantVarable.terminasionNotescontroller,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "_Add_notes_Here".tr(),
                    searchOrKnow: false,
                    obSecureText: false,
                    timeOrNo: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Loan extends StatefulWidget {
  @override
  _LoanState createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  List<LoanTypeModel> loantypelist = [
    LoanTypeModel(id: "1", name: "10"),
    LoanTypeModel(id: "2", name: "20"),
    LoanTypeModel(id: "3", name: "30"),
    LoanTypeModel(id: "4", name: "40"),
    LoanTypeModel(id: "5", name: "50"),
    LoanTypeModel(id: "6", name: "60"),
  ];

  LoanTypeModel selectItemModel;
  MonthModel selectEndmonth;
  MonthModel selecStartmonth;
  YearModel selectStartyear;
  YearModel selectEndyear;
  List<MonthModel> monthlist = [
    MonthModel(id: "1", name: "January"),
    MonthModel(id: "2", name: "February"),
    MonthModel(id: "3", name: "March"),
    MonthModel(id: "4", name: "April"),
    MonthModel(id: "5", name: "May"),
    MonthModel(id: "6", name: "June"),
    MonthModel(id: "7", name: "July"),
    MonthModel(id: "8", name: "August"),
    MonthModel(id: "9", name: "Septemper"),
    MonthModel(id: "10", name: "October"),
    MonthModel(id: "11", name: "November"),
    MonthModel(id: "12", name: "December"),
  ];
  List<YearModel> yearList = [
    YearModel(id: "1", name: "2010"),
    YearModel(id: "2", name: "2011"),
    YearModel(id: "3", name: "2012"),
    YearModel(id: "4", name: "2013"),
    YearModel(id: "5", name: "2014"),
    YearModel(id: "6", name: "2015"),
    YearModel(id: "7", name: "2016"),
    YearModel(id: "8", name: "2017"),
    YearModel(id: "9", name: "2018"),
    YearModel(id: "10", name: "2019"),
    YearModel(id: "11", name: "2020"),
    YearModel(id: "12", name: "2021"),
  ];
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_Loan_Type",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Container(
                    width: size.width / 2,
                    child: DropdownButton(
                      iconSize: 30,
                      icon: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Icon(Icons.arrow_drop_down)),
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "_Loan_ID",
                          style: Theme.of(context).textTheme.headline5,
                        ).tr(),
                      ),
                      value: selectItemModel,
                      isExpanded: true,
                      items: loantypelist.map((LoanTypeModel type) {
                        return DropdownMenuItem<LoanTypeModel>(
                          child: Text(type.name),
                          value: type,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectItemModel = value;
                        });
                      },
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "_Value",
                    style: Theme.of(context).textTheme.headline2,
                  ).tr(),
                  Expanded(
                    flex: 1,
                    child: TextFormFieldW(
                      textInputType: TextInputType.text,
                      controller: ConstantVarable.loanValuecontroller,
                      validator: (val) =>
                          UserController().validateAnyFeild(context, val),
                      hintText: "00",
                      searchOrKnow: false,
                      obSecureText: false,
                      timeOrNo: true,
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("_Installment_Value",
                      style: Theme.of(context).textTheme.headline2).tr(),
                  Text(prov.count.toString()),
                  Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            prov.discreamntcount();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            prov.increamentCount();
                          },
                        ),
                      ],
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
                                selectEndmonth = value;
                              });
                            }),
                      ))
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("_Installment_Value",
                      style: Theme.of(context).textTheme.headline2).tr(),
                  Text(prov.count.toString()),
                  Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            prov.discreamntcount();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            prov.increamentCount();
                          },
                        ),
                      ],
                    ),
                  ),
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
                            items: yearList.map((YearModel year) {
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
                              });
                            }),
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
                            items: yearList.map((YearModel year) {
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
                                selectEndyear = value;
                              });
                            }),
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

class PayrollAdjustment extends StatefulWidget {
  @override
  _PayrollAdjustmentState createState() => _PayrollAdjustmentState();
}

class _PayrollAdjustmentState extends State<PayrollAdjustment> {
  List<PayItemModel> payItemList = [
    PayItemModel(id: "1", name: "10"),
    PayItemModel(id: "2", name: "20"),
    PayItemModel(id: "3", name: "30"),
    PayItemModel(id: "4", name: "40"),
    PayItemModel(id: "5", name: "50"),
    PayItemModel(id: "6", name: "60"),
  ];

  PayItemModel selectpayItem;
  MonthModel selectEndmonth;
  MonthModel selecStartmonth;
  YearModel selectStartyear;
  YearModel selectEndyear;
  List<MonthModel> monthlist = [
    MonthModel(id: "1", name: "January"),
    MonthModel(id: "2", name: "February"),
    MonthModel(id: "3", name: "March"),
    MonthModel(id: "4", name: "April"),
    MonthModel(id: "5", name: "May"),
    MonthModel(id: "6", name: "June"),
    MonthModel(id: "7", name: "July"),
    MonthModel(id: "8", name: "August"),
    MonthModel(id: "9", name: "Septemper"),
    MonthModel(id: "10", name: "October"),
    MonthModel(id: "11", name: "November"),
    MonthModel(id: "12", name: "December"),
  ];
  List<YearModel> yearList = [
    YearModel(id: "1", name: "2010"),
    YearModel(id: "2", name: "2011"),
    YearModel(id: "3", name: "2012"),
    YearModel(id: "4", name: "2013"),
    YearModel(id: "5", name: "2014"),
    YearModel(id: "6", name: "2015"),
    YearModel(id: "7", name: "2016"),
    YearModel(id: "8", name: "2017"),
    YearModel(id: "9", name: "2018"),
    YearModel(id: "10", name: "2019"),
    YearModel(id: "11", name: "2020"),
    YearModel(id: "12", name: "2021"),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<PayrollAdjustmentRequest>(context);
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
                      items: payItemList.map((PayItemModel type) {
                        return DropdownMenuItem<PayItemModel>(
                          child: Text(type.name),
                          value: type,
                        );
                      }).toList(),
                      onChanged: (PayItemModel value) {
                        setState(() {
                          selectpayItem = value;
                        });
                      },
                    ),
                  )),
            ),
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
                                selectEndmonth = value;
                              });
                            }),
                      )),
                )),
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
                            items: yearList.map((YearModel year) {
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
                              });
                            }),
                      ))),
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
                        textInputType: TextInputType.text,
                        controller: ConstantVarable.payrollValueController,
                        validator: (val) =>
                            UserController().validateAnyFeild(context, val),
                        hintText: "00",
                        searchOrKnow: false,
                        obSecureText: false,
                        timeOrNo: true,
                      ),
                    ))),
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
                            items: yearList.map((YearModel year) {
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
                                selectEndyear = value;
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
                  controller: ConstantVarable.payrollNotesController,
                  validator: (val) =>
                      UserController().validateAnyFeild(context, val),
                  hintText: "_Add_notes_Here".tr(),
                  searchOrKnow: false,
                  obSecureText: false,
                  timeOrNo: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
