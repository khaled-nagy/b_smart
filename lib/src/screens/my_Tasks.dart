import 'package:b_smart/src/controllers/MyTasksController.dart';
import 'package:b_smart/src/statemanagment/StateProvider.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/TaskCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

class MyTasks extends StatefulWidget {
  @override
  createState() => MyTasksView();
}

class MyTasksView extends StateMVC<MyTasks> {
  MyTasksView() : super(MyTasksController()) {
    _myTasksController = MyTasksController.con;
  }
  MyTasksController _myTasksController;
  @override
  void initState() {
    _myTasksController.getTasksList("rejected");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provState = Provider.of<StateProvider>(context);
    return Scaffold(
        appBar: appbar(context: context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: provState.rejictedButton == false
                              ? InkWell(
                                  child: Container(
                                    width: size.width / 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xffd9534f),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "rejected",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                            size: provState.state == "rejected"
                                                ? 25
                                                : 0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    provState.rejictedButtonState(true);
                                    provState.stateType("rejected");
                                    _myTasksController
                                        .getTasksList("rejected")
                                        .then((value) {
                                      if (value == true) {
                                        provState.rejictedButtonState(false);
                                      } else {
                                        provState.rejictedButtonState(false);
                                      }
                                    });
                                  },
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50),
                                  child: CircularProgressIndicator(
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                  ),
                                )),
                      provState.newButton == false
                          ? Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: InkWell(
                                child: Container(
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xff5bc0de),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "new",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                          size:
                                              provState.state == "new" ? 25 : 0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  provState.newButtonState(true);
                                  provState.stateType("new");
                                  _myTasksController
                                      .getTasksList("new")
                                      .then((value) {
                                    if (value == true) {
                                      provState.newButtonState(false);
                                    } else {
                                      provState.newButtonState(false);
                                    }
                                  });
                                },
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: CircularProgressIndicator(
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                              ),
                            ),
                      provState.approvedButton == false
                          ? Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: InkWell(
                                child: Container(
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xff5cb85c),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "approved",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                          size: provState.state == "approved"
                                              ? 25
                                              : 0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  provState.approvedButtonState(true);
                                  provState.stateType("approved");
                                  _myTasksController
                                      .getTasksList("approved")
                                      .then((value) {
                                    if (value == true) {
                                      provState.approvedButtonState(false);
                                    } else {
                                      provState.approvedButtonState(false);
                                    }
                                  });
                                },
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: CircularProgressIndicator(
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              StreamBuilder(
                stream: _myTasksController.getTasksStream.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length < 1) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Center(
                          child: Text(
                            "There is no data ",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return TaskCard(data: snapshot.data[index]);
                          });
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).backgroundColor,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
