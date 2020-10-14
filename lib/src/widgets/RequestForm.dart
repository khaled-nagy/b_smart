import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/UserController.dart';
import 'package:b_smart/src/statemanagment/Requests_type.dart';
import 'package:b_smart/src/widgets/TextFormFieldW%20copy.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;

// Future<bool> pickerCalenderStart(BuildContext context, int id) async {
//   NepaliDateTime _selectedDateTime = await picker.showMaterialDatePicker(
//       context: context,
//       locale: EasyLocalization.of(context).locale,
//       initialDate: NepaliDateTime.now(),
//       firstDate: picker.NepaliDateTime(2000),
//       lastDate: picker.NepaliDateTime(2021));
//   print(_selectedDateTime.toString().substring(0, 10));

//   if (_selectedDateTime == null) {
//     return false;
//   } else {
//     switch (id) {
//       case 1:
//         {
//           ConstantVarable.vacationStartDay = _selectedDateTime.day;
//           ConstantVarable.vacationStartMonth = _selectedDateTime.month;
//           ConstantVarable.vacationStartYear = _selectedDateTime.year;

//           break;
//         }
//       case 2:
//         {
//           break;
//         }
//     }

//     return true;
//   }
// }

// Future<bool> pickerCalenderEnd(BuildContext context, int id) async {
//   NepaliDateTime _selectedDateTime = await picker.showMaterialDatePicker(
//       context: context,
//       locale: EasyLocalization.of(context).locale,
//       initialDate: picker.NepaliDateTime.now(),
//       firstDate: picker.NepaliDateTime(2000),
//       lastDate: picker.NepaliDateTime(2020));
//   ConstantVarable.vacationEndDay = _selectedDateTime.day;
//   ConstantVarable.vacationEndMonth = _selectedDateTime.month;
//   ConstantVarable.vacationEndYear = _selectedDateTime.year;
//   print(_selectedDateTime.toString().substring(0, 10));

//   if (_selectedDateTime == null) {
//     return false;
//   } else {
//     if (ConstantVarable.vacationEndDay > ConstantVarable.vacationStartDay &&
//         ConstantVarable.vacationEndMonth > ConstantVarable.vacationStartMonth &&
//         ConstantVarable.vacationEndYear > ConstantVarable.vacationStartYear) {
//       ConstantVarable.vacationEndCalender =
//           _selectedDateTime.toString().substring(0, 10);
//       return true;
//     } else {
//       Fluttertoast.showToast(
//           msg: "Please choose a date after the start date",
//           toastLength: Toast.LENGTH_LONG,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//       ConstantVarable.vacationEndCalender = "";
//       return false;
//     }
//   }
// }

// forms types

class Vacation extends StatefulWidget {
  @override
  _VacationState createState() => _VacationState();
}

class _VacationState extends State<Vacation> {
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
                    "Vacation Type ID ",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Container(
                    width: size.width / 2.3,
                    child: DropdownButton(
                      hint: Text(" Vacation ID"),
                      isExpanded: true,
                      value: prov.vacationTypeID,
                      items: [
                        DropdownMenuItem(
                          child: Text(" 1 "),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text(" 2 "),
                          value: "2",
                        ),
                        DropdownMenuItem(
                          child: Text(" 3 "),
                          value: "3",
                        )
                      ],
                      onChanged: (value) {
                        prov.vacationTypeID = value;
                      },
                    ),
                  )
                ],
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
                  title:  TextFormFieldW(
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
  @override
  _PermissionState createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
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
                  "Permission Type ID ",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Container(
                  width: size.width / 2.3,
                  child: DropdownButton(
                    hint: Text("Permision ID"),
                    value: prov.permisionTypeID,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        child: Text("1"),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text("2"),
                        value: "2",
                      ),
                      DropdownMenuItem(
                        child: Text("3"),
                        value: "3",
                      )
                    ],
                    onChanged: (value) {
                      prov.permisionTypeID = value;
                    },
                  ),
                )
              ],
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

class Assignment extends StatelessWidget {
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
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "New Location :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      hint: Text("Select New Location"),
                      value: prov.newLocation,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("6th,Octobre,City"),
                          value: "6th,Octobre,City",
                        ),
                        DropdownMenuItem(
                          child: Text("Elsadat City"),
                          value: "Elsadat City",
                        ),
                        DropdownMenuItem(
                          child: Text("Nasr City"),
                          value: "Nasr City",
                        )
                      ],
                      onChanged: (value) {
                        prov.newLocation = value;
                      },
                    ),
                  )),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "New Department :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      hint: Text("Select New Department"),
                      isExpanded: true,
                      value: prov.newDepartment,
                      items: [
                        DropdownMenuItem(
                          child: Text("Technical Support"),
                          value: "Technical Support",
                        ),
                        DropdownMenuItem(
                          child: Text("sowftware engineering"),
                          value: "sowftware engineering",
                        ),
                        DropdownMenuItem(
                          child: Text("customers service"),
                          value: "customers service",
                        )
                      ],
                      onChanged: (value) {
                        prov.newDepartment = value;
                      },
                    ),
                  )),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "New Position :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      hint: Text("Select New Postion"),
                      isExpanded: true,
                      value: prov.newPostion,
                      items: [
                        DropdownMenuItem(
                          child: Text("Manager"),
                          value: "Manager",
                        ),
                        DropdownMenuItem(
                          child: Text("Assistant"),
                          value: "Assistant",
                        ),
                        DropdownMenuItem(
                          child: Text("Technical"),
                          value: "Technical",
                        )
                      ],
                      onChanged: (value) {
                        prov.newPostion = value;
                      },
                    ),
                  )),
            ),
            SizedBox(
              height: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}

class VacationBalance extends StatelessWidget {
  @override
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
                        hint: Text("Select Vacation ID"),
                        isExpanded: true,
                        value: prov.vacationBalanceID,
                        items: [
                          DropdownMenuItem(
                            child: Text("1"),
                            value: "1",
                          ),
                          DropdownMenuItem(
                            child: Text("2"),
                            value: "2",
                          ),
                          DropdownMenuItem(
                            child: Text("3"),
                            value: "3",
                          )
                        ],
                        onChanged: (value) {
                          prov.vacationBalanceID = value;
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
                        hint: Text("Select Year"),
                        value: prov.year,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            child: Text("2018"),
                            value: "2018",
                          ),
                          DropdownMenuItem(
                            child: Text("2019"),
                            value: "2019",
                          ),
                          DropdownMenuItem(
                            child: Text("2020"),
                            value: "2020",
                          )
                        ],
                        onChanged: (value) {
                          prov.year = value;
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
                        controller: ConstantVarable.vacationBalanceadjustValueVontroller,
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
                    controller: ConstantVarable.vacationBalanceadjustNotesVontroller,
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
  @override
  _TerminationState createState() => _TerminationState();
}

class _TerminationState extends State<Termination> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<TermnisionRequest>(context);
    return SingleChildScrollView(
      child: Container(
        height: 470,
        width: size.width * 0.9,
        child: Column(
          children: [
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "Termination Type :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      isExpanded: true,
                      value: prov.terminationType,
                      hint: Text("Select Termination Type"),
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                          value: "2",
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                          value: "3",
                        )
                      ],
                      onChanged: (value) {
                        prov.terminationType = value;
                      },
                    ),
                  )),
            ),
            Container(
                height: 80.0,
                child: ListTile(
                  leading: Text(
                    "Last Working day",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title:  Text(ConstantVarable.terminasionLastWorkinDayCalender == null
                      ? "0000-00-00"
                      : ConstantVarable.terminasionLastWorkinDayCalender),
                  trailing: IconButton(
                    icon: Icon(Icons.calendar_today_rounded),
                    onPressed: () {
                      {
                        setState(() {
                          pickerCalenderStart(context, 1).then((value) {
                            if (value == true) {
                              setState(() {});
                            }
                          });
                        });

                        // _selectedDateTime = await picker.showMaterialDatePicker(
                        //     context: context,
                        //     initialDate: picker.NepaliDateTime.now(),
                        //     firstDate: picker.NepaliDateTime(2000),
                        //     lastDate: picker.NepaliDateTime(2090));
                        // print(_selectedDateTime);
                      }
                    },
                  ),
                )),
            Container(
              height: 80.0,
              child: ListTile(
                leading: Text(
                  "Notes :",
                  style: Theme.of(context).textTheme.headline2,
                ),
                title:  TextFormFieldW(
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
            ),
          ],
        ),
      ),
    );
  }
}

class Loan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<LoanRequest>(context);
    return SingleChildScrollView(
      child: Container(
        width: size.width * 0.9,
        child: Column(
          children: [
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "Loan Type :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      hint: Text("Select Loan Type"),
                      value: prov.loanType,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("test1"),
                          value: "test1",
                        ),
                        DropdownMenuItem(
                          child: Text("test2"),
                          value: "test2",
                        ),
                        DropdownMenuItem(
                          child: Text("test3"),
                          value: "test3",
                        )
                      ],
                      onChanged: (value) {
                        prov.loanType = value;
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
                      child:  TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller: ConstantVarable.loanValuecontroller,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "00",
                    searchOrKnow: false,
                    obSecureText: false,
                    timeOrNo: true,
                  ),)),
            ),
            Container(
                height: 80.0,
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.030,
                    ),
                    Text("Installments Count ",
                        style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.040,
                    ),
                    new Text(prov.count.toString()),
                    new SizedBox(
                      width: size.width * 0.2,
                    ),
                    new IconButton(
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
                )),
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "Start Month :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      hint: Text("Select Start Month"),
                      value: prov.startmonth,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Januray"),
                          value: "Januray",
                        ),
                        DropdownMenuItem(
                          child: Text("March"),
                          value: "March",
                        ),
                        DropdownMenuItem(
                          child: Text("May"),
                          value: "May",
                        )
                      ],
                      onChanged: (value) {
                        prov.startmonth = value;
                      },
                    ),
                  )),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "End Month :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      hint: Text("Select End Month"),
                      value: prov.endMonth,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("July"),
                          value: "July",
                        ),
                        DropdownMenuItem(
                          child: Text("August"),
                          value: "August",
                        ),
                        DropdownMenuItem(
                          child: Text("October"),
                          value: "October",
                        )
                      ],
                      onChanged: (value) {
                        prov.endMonth = value;
                      },
                    ),
                  )),
            ),
            Container(
                height: 80.0,
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.030,
                    ),
                    Text("InstallmentValue ",
                        style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.040,
                    ),
                    new Text(prov.value.toString()),
                    new SizedBox(
                      width: size.width * 0.2,
                    ),
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {
                        prov.discraemnetntvalue();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {
                        prov.incraementvalue();
                      },
                    ),
                  ],
                )),
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "Start Year:",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      hint: Text("Select Start Year"),
                      value: prov.startYear,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("2018"),
                          value: "2018",
                        ),
                        DropdownMenuItem(
                          child: Text("2019"),
                          value: "2019",
                        ),
                        DropdownMenuItem(
                          child: Text("2020"),
                          value: "2020",
                        )
                      ],
                      onChanged: (value) {
                        prov.startYear = value;
                      },
                    ),
                  )),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "End Year :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      hint: Text("Select End Year"),
                      value: prov.endYear,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("2021"),
                          value: "2021",
                        ),
                        DropdownMenuItem(
                          child: Text("2022"),
                          value: "2022",
                        ),
                        DropdownMenuItem(
                          child: Text("2023"),
                          value: "2023",
                        )
                      ],
                      onChanged: (value) {
                        prov.endYear = value;
                      },
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class PayrollAdjustment extends StatelessWidget {
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
                    "PayItem :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      value: prov.payItem,
                      hint: Text("Select Pay Item"),
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                          value: "2",
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                          value: "3",
                        )
                      ],
                      onChanged: (value) {
                        prov.payItem = value;
                      },
                    ),
                  )),
            ),
            Container(
              height: 65.0,
              child: ListTile(
                  leading: Text(
                    "Start Month :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      value: prov.startMonth,
                      hint: Text("Select Start Month"),
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Januray"),
                          value: "Januray",
                        ),
                        DropdownMenuItem(
                          child: Text("April"),
                          value: "April",
                        ),
                        DropdownMenuItem(
                          child: Text("Decemper"),
                          value: "Decemper",
                        )
                      ],
                      onChanged: (value) {
                        prov.startMonth = value;
                      },
                    ),
                  )),
            ),
            Container(
              height: 65.0,
              child: ListTile(
                  leading: Text(
                    "End Month :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      value: prov.endMonth,
                      hint: Text("Select End Month"),
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("March"),
                          value: "March",
                        ),
                        DropdownMenuItem(
                          child: Text("May"),
                          value: "May",
                        ),
                        DropdownMenuItem(
                          child: Text("June"),
                          value: "June",
                        )
                      ],
                      onChanged: (value) {
                        prov.endMonth = value;
                      },
                    ),
                  )),
            ),
            Container(
              height: 65.0,
              child: ListTile(
                  leading: Text(
                    "Start Year :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      value: prov.startYear,
                      hint: Text("Select Start Year"),
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("2020"),
                          value: "2020",
                        ),
                        DropdownMenuItem(
                          child: Text("2021"),
                          value: "2021",
                        ),
                        DropdownMenuItem(
                          child: Text("2022"),
                          value: "2022",
                        )
                      ],
                      onChanged: (value) {
                        prov.startYear = value;
                      },
                    ),
                  )),
            ),
            Container(
                height: 65.0,
                child: ListTile(
                    leading: Text(
                      "Value:",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    title: Container(child:  TextFormFieldW(
                    textInputType: TextInputType.text,
                    controller: ConstantVarable.payrollValueController,
                    validator: (val) =>
                        UserController().validateAnyFeild(context, val),
                    hintText: "00",
                    searchOrKnow: false,
                    obSecureText: false,
                    timeOrNo: true,
                  ),))),
            Container(
              height: 65.0,
              child: ListTile(
                  leading: Text(
                    "End Year :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      value: prov.endyear,
                      hint: Text("Select End year"),
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("2023"),
                          value: "2023",
                        ),
                        DropdownMenuItem(
                          child: Text("2024"),
                          value: "2024",
                        ),
                        DropdownMenuItem(
                          child: Text("2025"),
                          value: "2025",
                        )
                      ],
                      onChanged: (value) {
                        prov.endyear = value;
                      },
                    ),
                  )),
            ),
            Container(
              height: 65.0,
              child: ListTile(
                leading: Text(
                  "Notes",
                  style: Theme.of(context).textTheme.headline2,
                ),
                title:  TextFormFieldW(
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
