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
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    _myrequestcontroller.getRequestsList().then((done) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(context: context),
        body: isLoading == false
            ? _myrequestcontroller.requestsList.length == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Center(
                      child: Text(
                        "There is no data ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _myrequestcontroller.requestsList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RequestCard(
                        data: _myrequestcontroller.requestsList[index],
                      );
                    })
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
              ));
  }
}
