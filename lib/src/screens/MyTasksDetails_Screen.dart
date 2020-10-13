import 'package:b_smart/src/controllers/MyTasksDetailsController.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';
import 'package:flutter/material.dart';

 import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
 
class MyTaskesDetails extends StatefulWidget {
  @override
  createState() => MyTaskesDetailsView();
}

class MyTaskesDetailsView extends StateMVC<MyTaskesDetails> {
  MyTaskesDetailsView() : super(TasksDetailesCOntroller()) {
    _myTaskesDetailscontroller = TasksDetailesCOntroller.con;
  }
  TasksDetailesCOntroller _myTaskesDetailscontroller;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context: context),
      body: SingleChildScrollView(
        child: Card(
                  child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  "Task Detailes",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Card(
                elevation: 2,
                child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ListTile(
                      leading: Icon(Icons.code,color:Theme.of(context).backgroundColor,size: 30.0,),
                      title: Text("Request Code: ",
                          style: TextStyle(fontSize: 20.0)),
                      subtitle: Container(child: new Text("#30")),
                    )),
              ),
              Card(
                elevation: 2,
                child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ListTile(
                      leading: Icon(Icons.request_page,color:Theme.of(context).backgroundColor,size: 30.0),
                      title: Text("Request Type: ",
                          style: TextStyle(fontSize: 20.0)),
                      subtitle: Container(child: new Text("Vacation request")),
                    )),
              ),
              Card(
                elevation: 2,
                child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ListTile(
                      leading: Icon(Icons.date_range,color:Theme.of(context).backgroundColor,size: 30.0),
                      title: Text("Date: ", style: TextStyle(fontSize: 20.0)),
                      subtitle: Container(
                          child: new Text("may.10.2020" + "  (5:00 PM)")),
                    )),
              ),
              Card(
                elevation: 2,
                child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ListTile(
                      leading: Icon(Icons.code,color:Theme.of(context).backgroundColor,size: 30.0),
                      title: Text("Status: ", style: TextStyle(fontSize: 20.0)),
                      trailing: Container(
                          child: new Text(
                        "New",
                        style:Theme.of(context).textTheme.headline4 ,
                      )),
                    )),
              ),
              Card(
                elevation: 2,
                child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ListTile(
                      leading: Icon(Icons.edit,color:Theme.of(context).backgroundColor,size: 30.0),
                      title: Text("Notes: ", style: TextStyle(fontSize: 20.0)),
                      subtitle: Text("i want to take a vacation Request , Because i am tired"),
                    )),
              ),
                 
                Card(
                elevation: 2,
                child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonW(
                          text:"Approve" ,
                          color: Colors.green,
                          width: size.width*0.4,
                          onpress: (){},
                          textstyle: Theme.of(context).textTheme
                          .headline1,
                        ),
                        ButtonW(
                          text:"Reject" ,
                          color:Colors.red,
                          width: size.width*0.4,
                          onpress: (){},
                          textstyle: Theme.of(context).textTheme
                          .headline1,
                        ),
                      ],
                    ) ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
