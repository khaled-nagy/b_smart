import 'package:b_smart/src/statemanagment/Requests_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// forms types
class Vacation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<VacationRequest>(context);
    var size = MediaQuery.of(context).size;
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
                    "Vacation Type ID :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      hint: Text("Select Vacation Type ID"),
                      isExpanded: true,
                      value: prov.vacationTypeID,
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
                        prov.vacationTypeID = value;
                      },
                    ),
                  )),
            ),
            Container(
                height: 80.0,
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text("Number Of Days :",
                        style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.040,
                    ),
                    new Text(prov.counter.toString()),
                    new SizedBox(
                      width: size.width * 0.2,
                    ),
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
                )),
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "Start Date",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Text("10/8/2020"),
                  trailing: Icon(Icons.calendar_today_rounded)),
            ),
            Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "End Date",
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
        height: 470,
        width: size.width * 0.9,
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
                        prov.vacationBalanceID=value;
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
                        prov.year=value;
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
                    child: Text("1000")
                  )),
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

class Termination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov= Provider.of<TermnisionRequest>(context);
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
                        prov.terminationType=value;
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

class Loan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final prov =Provider.of<LoanRequest>(context);
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
                        prov.loanType=value;
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
                    )
                  )),
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
                        prov.startmonth=value;
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
                        prov.endMonth=value;
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
                        prov.startYear=value;
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
                        prov.endYear=value;
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
    final prov =Provider.of<PayrollAdjustmentRequest>(context);
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
                        prov.payItem=value;
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
                        prov.startMonth=value;
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
                        prov.endMonth=value;
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
                        prov.startYear=value;
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
                    title: Container(
                      child: TextFormField()
                    ))),
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
                        prov.endyear=value;
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
