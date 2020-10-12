import 'package:b_smart/src/controllers/MyRequestController.dart';
import 'package:b_smart/src/controllers/RequestDetailesController.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';

class MyRequestDetailes extends StatefulWidget {
  @override
  createState() => MyRequestDetailesView();
}

class MyRequestDetailesView extends StateMVC<MyRequestDetailes> {
  MyRequestDetailesView() : super(RequestDetailesController()) {
    _myRequestDetailescontroller = RequestDetailesController.con;
  }
  RequestDetailesController _myRequestDetailescontroller;
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
                  "Request Detailes",
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
                      title: Text("State: ", style: TextStyle(fontSize: 20.0)),
                      trailing: Container(
                          child: new Text(
                        "Approved",
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      )),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
