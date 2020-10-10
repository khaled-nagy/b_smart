import 'package:flutter/material.dart';

// forms types
class Vacation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  )),
            ),
            Container(
                height: 80.0,
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    Text("Number Of Days :",
                        style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    new Text("1"),
                    new SizedBox(
                      width: size.width * 0.23,
                    ),
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
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
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    Text("Duration ",
                        style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    new Text("1"),
                    new SizedBox(
                      width: size.width * 0.23,
                    ),
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    ),
                    new Text("Minute")
                  ],
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Test1"),
                        ),
                        DropdownMenuItem(
                          child: Text("Test2"),
                        ),
                        DropdownMenuItem(
                          child: Text("Test3"),
                        )
                      ],
                      onChanged: (value) {},
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Test1"),
                        ),
                        DropdownMenuItem(
                          child: Text("Test2"),
                        ),
                        DropdownMenuItem(
                          child: Text("Test3"),
                        )
                      ],
                      onChanged: (value) {},
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Test1"),
                        ),
                        DropdownMenuItem(
                          child: Text("Test2"),
                        ),
                        DropdownMenuItem(
                          child: Text("Test3"),
                        )
                      ],
                      onChanged: (value) {},
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  )),
            ),
            Container(
                height: 80.0,
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    Text("Year ", style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    new Text("1"),
                    new SizedBox(
                      width: size.width * 0.41,
                    ),
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    ),
                  ],
                )),
            Container(
                height: 80.0,
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    Text("Value ", style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    new Text("1"),
                    new SizedBox(
                      width: size.width * 0.39,
                    ),
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    ),
                  ],
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

class Termination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    "Termination Type :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("dadddd1"),
                        ),
                        DropdownMenuItem(
                          child: Text("dddd2"),
                        ),
                        DropdownMenuItem(
                          child: Text("dddd3"),
                        )
                      ],
                      onChanged: (value) {},
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  )),
            ),
            Container(
                height: 80.0,
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    Text("Value ", style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    new Text("1"),
                    new SizedBox(
                      width: size.width * 0.41,
                    ),
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    ),
                  ],
                )),
            Container(
                height: 80.0,
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    Text("Installments Count ",
                        style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    new Text("1"),
                    new SizedBox(
                      width: size.width * 0.2,
                    ),
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  )),
            ),Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "End Month :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  )),
            ),Container(
                height: 80.0,
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    Text("InstallmentValue ",
                        style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    new Text("1"),
                    new SizedBox(
                      width: size.width * 0.2,
                    ),
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    ),
                  ],
                )),
              Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "Start Year :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  ))),
                    Container(
              height: 80.0,
              child: ListTile(
                  leading: Text(
                    "End Year :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  ))),  SizedBox(
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
          ),  SizedBox(
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  )),
            ),Container(
              height: 65.0,
              child: ListTile(
                  leading: Text(
                    "End Month :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  ))),  Container(
                height: 65.0,
                child: new Row(
                  children: [
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    Text("Value ", style: Theme.of(context).textTheme.headline2),
                    new SizedBox(
                      width: size.width * 0.048,
                    ),
                    new Text("1"),
                    new SizedBox(
                      width: size.width * 0.41,
                    ),
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    ),
                  ],
                )),
           
              Container(
              height: 65.0,
              child: ListTile(
                  leading: Text(
                    "Start Year :",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Container(
                    child: DropdownButton(
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
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
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("1"),
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  ))),  Container(
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
          ),  SizedBox(
            height: 40.0,
          ),
          ],
        ),
      ),
    );
  }
}
