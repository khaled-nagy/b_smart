import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/controllers/newRequestsController.dart';
import 'package:b_smart/src/data/models/DepartmentModel.dart';
import 'package:b_smart/src/data/models/LoanModel.dart';
import 'package:b_smart/src/data/models/LocationModel.dart';
import 'package:b_smart/src/data/models/MonthModel.dart';
import 'package:b_smart/src/data/models/PayItemModel.dart';
import 'package:b_smart/src/data/models/PermissionIdModel.dart';
import 'package:b_smart/src/data/models/PositionModel.dart';
import 'package:b_smart/src/data/models/TerminasionModel.dart';
import 'package:b_smart/src/data/models/VacationBalanceIDModel.dart';
import 'package:b_smart/src/data/models/VacationModel.dart';
import 'package:b_smart/src/data/models/YearModel.dart';
import 'package:b_smart/src/statemanagment/Requests_type.dart';
import 'package:b_smart/src/widgets/TextFormFieldW%20copy.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

// forms types

class Vacation extends StatefulWidget {
  createState() => VacationState();
}

class VacationState extends StateMVC<Vacation> {
  VacationState() : super(NewRequestsController()) {
    _newRequestsController = NewRequestsController.con;
  }

  NewRequestsController _newRequestsController;

  VacationModel selectedVacationId;

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
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<VacationModel>(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Text(
                            "Vacation Type",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        underline: Container(),
                        value: selectedVacationId,
                        iconSize: 30,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down),
                        items: _newRequestsController.vacationList
                            .map((VacationModel vacation) {
                          return DropdownMenuItem<VacationModel>(
                              value: vacation,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  vacation.foreignName,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ));
                        }).toList(),
                        onChanged: (VacationModel value) {
                          setState(() {
                            selectedVacationId = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Number Of Days ",
                      style: Theme.of(context).textTheme.headline2),
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
                    "Start Date",
                    style: Theme.of(context).textTheme.headline2,
                  ),
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
                    "End Date",
                    style: Theme.of(context).textTheme.headline2,
                  ),
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
                    "Notes :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller: ConstantVarable.vacationNotesController,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "You Can Add Notes Here",
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
  createState() => PermissionState();
}

class PermissionState extends StateMVC<Permission> {
  PermissionState() : super(NewRequestsController()) {
    _newRequestsController = NewRequestsController.con;
  }

  NewRequestsController _newRequestsController;

  PermissionModel selectedPermissoonId;

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
            Card(
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<PermissionModel>(
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          "Permission Type",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      underline: Container(),
                      value: selectedPermissoonId,
                      iconSize: 30,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down),
                      items: _newRequestsController.permissionList
                          .map((PermissionModel permission) {
                        return DropdownMenuItem<PermissionModel>(
                            value: permission,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                permission.foreignName,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ));
                      }).toList(),
                      onChanged: (PermissionModel value) {
                        setState(() {
                          selectedPermissoonId = value;
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
                  "Permisson Date",
                  style: Theme.of(context).textTheme.headline2,
                ),
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
                Text("Duration ", style: Theme.of(context).textTheme.headline2),
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
                Text("Minute")
              ],
            ),
            Row(
              children: [
                Text(
                  "Start Time",
                  style: Theme.of(context).textTheme.headline2,
                ),
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
                  "End Time",
                  style: Theme.of(context).textTheme.headline2,
                ),
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
                  "Notes",
                  style: Theme.of(context).textTheme.headline2,
                ),
                title: TextFormFieldW(
                  textInputType: TextInputType.text,
                  controller: ConstantVarable.permissionNotesController,
                  validator: (val) =>
                      UserController().validateAnyFeild(context, val),
                  hintText: "You Can Add Notes here ",
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
  createState() => _AssignmentState();
}

class _AssignmentState extends StateMVC<Assignment> {
  _AssignmentState() : super(NewRequestsController()) {
    _newRequestsController = NewRequestsController.con;
  }
  NewRequestsController _newRequestsController;

  LocationModel selectedlocation;

  DepartmentModel selectedDepartment;

  PositionModel selectedPosition;
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
                  "New Location ",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Container(
                    width: size.width / 2,
                    child: Card(
                      child: DropdownButton<LocationModel>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "Location",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          underline: Container(),
                          value: selectedlocation,
                          iconSize: 30,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          items: _newRequestsController.locationList
                              .map((LocationModel location) {
                            return DropdownMenuItem<LocationModel>(
                                value: location,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    location.foreignName,
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (LocationModel value) {
                            setState(() {
                              selectedlocation = value;
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
                  "New Department ",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Container(
                    width: size.width / 2,
                    child: Card(
                      child: DropdownButton<DepartmentModel>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "Department",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          underline: Container(),
                          value: selectedDepartment,
                          iconSize: 30,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          items: _newRequestsController.departmentList
                              .map((DepartmentModel year) {
                            return DropdownMenuItem<DepartmentModel>(
                                value: year,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    year.foreignName,
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (DepartmentModel value) {
                            setState(() {
                              selectedDepartment = value;
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
                  "New Position ",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Container(
                    width: size.width / 2,
                    child: Card(
                      child: DropdownButton<PositionModel>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "Position",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          underline: Container(),
                          value: selectedPosition,
                          iconSize: 30,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          items: _newRequestsController.positionList
                              .map((PositionModel position) {
                            return DropdownMenuItem<PositionModel>(
                                value: position,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    position.foreignName,
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (PositionModel value) {
                            setState(() {
                              selectedPosition = value;
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
                      "Vacation Type ID :",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    title: Container(
                      child: DropdownButton(
                        hint: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Vacation ID",
                              style: Theme.of(context).textTheme.headline5),
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
                      "Year :",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    title: Container(
                      child: DropdownButton(
                        hint: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Select Year",
                              style: Theme.of(context).textTheme.headline5),
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
                      "Value :",
                      style: Theme.of(context).textTheme.headline2,
                    ),
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
                    "Notes",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller:
                        ConstantVarable.vacationBalanceadjustNotesVontroller,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "You Can Add Notes Here",
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
  createState() => _TerminationState();
}

class _TerminationState extends StateMVC<Termination> {
  _TerminationState() : super(NewRequestsController()) {
    _newRequestsController = NewRequestsController.con;
  }
  NewRequestsController _newRequestsController;

  TerminasionModel selectedTerminationt;
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
            Card(
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<TerminasionModel>(
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          "Termination Type",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      underline: Container(),
                      value: selectedTerminationt,
                      iconSize: 30,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down),
                      items: _newRequestsController.terminationList
                          .map((TerminasionModel terminasion) {
                        return DropdownMenuItem<TerminasionModel>(
                            value: terminasion,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                terminasion.foreignName,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ));
                      }).toList(),
                      onChanged: (TerminasionModel value) {
                        setState(() {
                          selectedTerminationt = value;
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
                  "Last Working day",
                  style: Theme.of(context).textTheme.headline2,
                ),
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
                  "Notes :",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Container(
                  width: size.width / 1.5,
                  child: TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller: ConstantVarable.terminasionNotescontroller,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "You Can Add Notes Here",
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
  createState() => _LoanState();
}

class _LoanState extends StateMVC<Loan> {
  _LoanState() : super(NewRequestsController()) {
    _newRequestsController = NewRequestsController.con;
  }
  NewRequestsController _newRequestsController;

  LoanModel selectedLoan;
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
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<LoanModel>(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Text(
                            "Permission Type",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        underline: Container(),
                        value: selectedLoan,
                        iconSize: 30,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down),
                        items: _newRequestsController.loanList
                            .map((LoanModel loan) {
                          return DropdownMenuItem<LoanModel>(
                              value: loan,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  loan.foreignName,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ));
                        }).toList(),
                        onChanged: (LoanModel value) {
                          setState(() {
                            selectedLoan = value;
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
                    "Value :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
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
                  Text("Installments Count ",
                      style: Theme.of(context).textTheme.headline2),
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
                    "Start Month ",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Container(
                      width: size.width / 2,
                      child: Card(
                        child: DropdownButton<MonthModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "Start Month",
                                style: Theme.of(context).textTheme.headline5,
                              ),
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
                    "End Month ",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Container(
                      width: size.width / 2,
                      child: Card(
                        child: DropdownButton<MonthModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "End Month",
                                style: Theme.of(context).textTheme.headline5,
                              ),
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
                  Text("InstallmentValue ",
                      style: Theme.of(context).textTheme.headline2),
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
                    "Start Year",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Container(
                      width: size.width / 2,
                      child: Card(
                        child: DropdownButton<YearModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "Start Year",
                                style: Theme.of(context).textTheme.headline5,
                              ),
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
                    "End Year",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Container(
                      width: size.width / 2,
                      child: Card(
                        child: DropdownButton<YearModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "End Year",
                                style: Theme.of(context).textTheme.headline5,
                              ),
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
                    "PayItem ",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton<PayItemModel>(
                      iconSize: 30,
                      icon: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Icon(Icons.arrow_drop_down)),
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Pay Item",
                          style: Theme.of(context).textTheme.headline5,
                        ),
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
                    "Start Month ",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                      width: size.width / 2,
                      child: Card(
                        child: DropdownButton<MonthModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "Start Month",
                                style: Theme.of(context).textTheme.headline5,
                              ),
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
                    "End Month ",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                      width: size.width / 2,
                      child: Card(
                        child: DropdownButton<MonthModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "End Month",
                                style: Theme.of(context).textTheme.headline5,
                              ),
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
                    "Start Year ",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                      width: size.width / 2,
                      child: Card(
                        child: DropdownButton<YearModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "Start Year",
                                style: Theme.of(context).textTheme.headline5,
                              ),
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
                      "Value:",
                      style: Theme.of(context).textTheme.headline2,
                    ),
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
                    "End Year ",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                      width: size.width / 2,
                      child: Card(
                        child: DropdownButton<YearModel>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "End Year",
                                style: Theme.of(context).textTheme.headline5,
                              ),
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
                  "Notes",
                  style: Theme.of(context).textTheme.headline2,
                ),
                title: TextFormFieldW(
                  textInputType: TextInputType.text,
                  controller: ConstantVarable.payrollNotesController,
                  validator: (val) =>
                      UserController().validateAnyFeild(context, val),
                  hintText: "You Can Add Notes Here",
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
