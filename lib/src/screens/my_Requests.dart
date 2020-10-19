import 'package:b_smart/src/controllers/MyRequestController.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/RequestCard.dart';
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
  void initState() {
    _myrequestcontroller.getRequestsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appbar(context: context),
        body: StreamBuilder(
          stream: _myrequestcontroller.getRequestsStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RequestCard(
                      data: snapshot.data[index],
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
              );
            }
          },
        ));
  }
}
