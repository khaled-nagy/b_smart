import 'package:b_smart/src/controllers/MyTasksController.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/TaskCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
        body: ListView.builder(
            itemCount: 7,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return TaskCard();
            }));
  }
}
