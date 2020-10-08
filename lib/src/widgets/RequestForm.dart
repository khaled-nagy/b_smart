import 'package:flutter/material.dart';

// forms types
class Vacation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 470,
      width: size.width * 0.9,
      child: Column(
        children: [
          Container(
              height: 80.0,
            child: ListTile(
                leading: Text("Vacation Type ID :",style: Theme.of(context).textTheme.headline2,),
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
              leading: Text("Number Of Days :",style: Theme.of(context).textTheme.headline2,),
              title: Text("1"),
              trailing: Container(
                width: size.width * 0.245,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("Start Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("10/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("End Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("15/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
              leading: Text("Notes",style: Theme.of(context).textTheme.headline2,),
              title: TextFormField(),
            ),
          ),SizedBox(
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
    );
  }
}


class Permission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 470,
      width: size.width * 0.9,
      child: Column(
        children: [
          Container(
              height: 80.0,
            child: ListTile(
                leading: Text("Vacation Type ID :",style: Theme.of(context).textTheme.headline2,),
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
              leading: Text("Number Of Days :",style: Theme.of(context).textTheme.headline2,),
              title: Text("1"),
              trailing: Container(
                width: size.width * 0.245,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("Start Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("10/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("End Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("15/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
              leading: Text("Notes",style: Theme.of(context).textTheme.headline2,),
              title: TextFormField(),
            ),
          ),SizedBox(
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
    );
  }
}


class Assignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 470,
      width: size.width * 0.9,
      child: Column(
        children: [
          Container(
              height: 80.0,
            child: ListTile(
                leading: Text("Vacation Type ID :",style: Theme.of(context).textTheme.headline2,),
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
              leading: Text("Number Of Days :",style: Theme.of(context).textTheme.headline2,),
              title: Text("1"),
              trailing: Container(
                width: size.width * 0.245,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("Start Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("10/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("End Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("15/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
              leading: Text("Notes",style: Theme.of(context).textTheme.headline2,),
              title: TextFormField(),
            ),
          ),SizedBox(
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
    );
  }
}


class VacationBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 470,
      width: size.width * 0.9,
      child: Column(
        children: [
          Container(
              height: 80.0,
            child: ListTile(
                leading: Text("Vacation Type ID :",style: Theme.of(context).textTheme.headline2,),
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
              leading: Text("Number Of Days :",style: Theme.of(context).textTheme.headline2,),
              title: Text("1"),
              trailing: Container(
                width: size.width * 0.245,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("Start Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("10/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("End Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("15/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
              leading: Text("Notes",style: Theme.of(context).textTheme.headline2,),
              title: TextFormField(),
            ),
          ),SizedBox(
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
    );
  }
}



class Termination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 470,
      width: size.width * 0.9,
      child: Column(
        children: [
          Container(
              height: 80.0,
            child: ListTile(
                leading: Text("Vacation Type ID :",style: Theme.of(context).textTheme.headline2,),
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
              leading: Text("Number Of Days :",style: Theme.of(context).textTheme.headline2,),
              title: Text("1"),
              trailing: Container(
                width: size.width * 0.245,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("Start Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("10/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("End Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("15/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
              leading: Text("Notes",style: Theme.of(context).textTheme.headline2,),
              title: TextFormField(),
            ),
          ),SizedBox(
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
    );
  }
}



class Loan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 470,
      width: size.width * 0.9,
      child: Column(
        children: [
          Container(
              height: 80.0,
            child: ListTile(
                leading: Text("Vacation Type ID :",style: Theme.of(context).textTheme.headline2,),
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
              leading: Text("Number Of Days :",style: Theme.of(context).textTheme.headline2,),
              title: Text("1"),
              trailing: Container(
                width: size.width * 0.245,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("Start Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("10/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("End Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("15/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
              leading: Text("Notes",style: Theme.of(context).textTheme.headline2,),
              title: TextFormField(),
            ),
          ),SizedBox(
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
    );
  }
}
 
class PayrollAdjustment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 470,
      width: size.width * 0.9,
      child: Column(
        children: [
          Container(
              height: 80.0,
            child: ListTile(
                leading: Text("Vacation Type ID :",style: Theme.of(context).textTheme.headline2,),
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
              leading: Text("Number Of Days :",style: Theme.of(context).textTheme.headline2,),
              title: Text("1"),
              trailing: Container(
                width: size.width * 0.245,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("Start Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("10/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
                leading: Text("End Date",style: Theme.of(context).textTheme.headline2,),
                title: Text("15/8/2020"),
                trailing: Icon(Icons.calendar_today_rounded)),
          ),
          Container(
            height: 80.0,
            child: ListTile(
              leading: Text("Notes",style: Theme.of(context).textTheme.headline2,),
              title: TextFormField(),
            ),
          ),SizedBox(
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
    );
  }
}