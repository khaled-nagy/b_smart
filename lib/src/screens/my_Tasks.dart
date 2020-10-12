import 'package:b_smart/src/controllers/MyTasksController.dart';
import 'package:b_smart/src/screens/MyTasksDetails_Screen.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';

class MyTasks extends StatefulWidget {
  @override
  createState() => MyTasksView();
}

class MyTasksView extends StateMVC<MyTasks> {
  MyTasksView() : super(MyTasksController()) {
    _mytasksdetaailsocntroller = MyTasksController.con;
  }
  MyTasksController _mytasksdetaailsocntroller;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context: context),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MyTaskesDetails();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    height: 140.0,
                    width: size.width * 0.8,
                    child: ListTile(
                      
                      title: Text(
                        "Vacation Request",
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text( "#30",
                              style:Theme.of(context).textTheme.headline4),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text("May.10.2020" + " (5:00 PM)",style: Theme.of(context).textTheme.headline4,)
                        ],
                      ),
                      trailing: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Theme.of(context).backgroundColor,
                            ),
                            child: Container(
                                height: 38.0,
                                width: size.width * 0.2,
                                child: Center(
                                    child: Text(
                                  "New",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ))),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
