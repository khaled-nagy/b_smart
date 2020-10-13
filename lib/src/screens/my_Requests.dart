import 'package:b_smart/src/controllers/MyRequestController.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/RequestCard.dart';
import 'package:b_smart/src/widgets/TaskCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class MyRequestScreen extends StatefulWidget {
  @override
  createState() => MyRequestView();
}

class MyRequestView extends StateMVC<MyRequestScreen> {
  MyRequestView() : super(MyRequestController()) {
    _myrequestcontroller = MyRequestController.con;
  }
  MyRequestController _myrequestcontroller;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appbar(context: context),
        body: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return RequestCard();
            }));
  }
}
