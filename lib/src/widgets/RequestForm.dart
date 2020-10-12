import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/statemanagment/Requests_type.dart';
import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;

Future<bool> pickerCalenderStart(BuildContext context, int id) async {
  NepaliDateTime _selectedDateTime = await picker.showMaterialDatePicker(
      context: context,
      locale: Locale("en"),
      initialDate: picker.NepaliDateTime.now(),
      firstDate: picker.NepaliDateTime(2000),
      lastDate: picker.NepaliDateTime(2090));
  print(_selectedDateTime.toString().substring(0, 10));
  ConstantVarable.vacationStartCalender =
      _selectedDateTime.toString().substring(0, 10);
  if (_selectedDateTime == null) {
    return false;
  } else {
    return true;
  }
}

Future<bool> pickerCalenderEnd(BuildContext context, int id) async {
  NepaliDateTime _selectedDateTime = await picker.showMaterialDatePicker(
      context: context,
      locale: Locale("en"),
      initialDate: picker.NepaliDateTime.now(),
      firstDate: picker.NepaliDateTime(2000),
      lastDate: picker.NepaliDateTime(2090));
  print(_selectedDateTime.toString().substring(0, 10));
  ConstantVarable.vacationEndCalender =
      _selectedDateTime.toString().substring(0, 10);
  if (_selectedDateTime == null) {
    return false;
  } else {
    return true;
  }
}

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
                    "Vacation Type ID :",
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
                  Text("Number Of Days :",
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
                  Text(ConstantVarable.vacationStartCalender == null
                      ? "0000-00-00"
                      : ConstantVarable.vacationStartCalender),
                  IconButton(
                      icon: Icon(Icons.calendar_today_rounded),
                      onPressed: () {
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
                      })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "End Date",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(ConstantVarable.vacationEndCalender == null
                      ? "0000-00-00"
                      : ConstantVarable.vacationEndCalender),
                  IconButton(
                      icon: Icon(Icons.calendar_today_rounded),
                      onPressed: () {
                        pickerCalenderEnd(context, 1).then((value) {
                          if (value == true) {
                            setState(() {});
                          }
                        });
                      })
                ],
              ),
              Container(
                height: 80.0,
                child: ListTile(
                  leading: Text(
                    "Notes",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: TextFormField(),
                ),
              ),
              Container(
                color: Theme.of(context).backgroundColor,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Save Request",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Permission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov = Provider.of<PermissionRequest>(context);
    return SingleChildScrollView(
      child: Container(
        height: 550,
        width: size.width * 0.9,
        child: Column(
          children: [
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "Permission Type ID :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      hint: Text("Select Permision ID"),
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
                  )),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "Permission Date",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Text("10/8/2020"),
                  trailing: Icon(Icons.calendar_today_rounded)),
            ),
            Container(
                height: 80.0,
                child: Container(
                  width: size.width,
                  child: new Row(
                    children: [
                      new SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text("Duration ",
                          style: Theme.of(context).textTheme.headline2),
                      new SizedBox(
                        width: size.width * 0.040,
                      ),
                      new Text(prov.durationCounter.toString()),
                      new SizedBox(
                        width: size.width * 0.2,
                      ),
                      new IconButton(
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
                      new Text("Minute")
                    ],
                  ),
                )),
            Container(
                height: 80.0,
                child: ListTile(
                  leading: Text(
                    "Start Time",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Text("00.00"),
                )),
            Container(
                height: 80.0,
                child: ListTile(
                  leading: Text(
                    "End Time",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Text("00.00"),
                )),
            Container(
              height: 80.0,
              child: ListTile(
                leading: Text(
                  "Notes",
                  style: Theme.of(context).textTheme.headline2,
                ),
                title: TextFormField(),
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Save Request",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            )
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
                        prov.newPostion = value;
                      },
                    ),
                  )),
            ),
            SizedBox(
              height: 18.0,
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Save Request",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            )
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
                    title: Container(child: Text("1000"))),
              ),
              Container(
                height: 80.0,
                child: ListTile(
                  leading: Text(
                    "Notes",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: TextFormField(),
                ),
              ),
              Container(
                color: Theme.of(context).backgroundColor,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Save Request",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Termination extends StatelessWidget {
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
                  title: Text("15/8/2020"),
                  trailing: Icon(Icons.calendar_today_rounded)),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                leading: Text(
                  "Notes",
                  style: Theme.of(context).textTheme.headline2,
                ),
                title: TextFormField(),
              ),
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Save Request",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            )
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
                      child: TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                  ))),
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
                        prov.endYear = value;
                      },
                    ),
                  )),
            ),
            SizedBox(
              height: 18.0,
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Save Request",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
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
                    title: Container(child: TextFormField()))),
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
                title: TextFormField(),
              ),
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Save Request",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
