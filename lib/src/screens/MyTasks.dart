import 'package:b_smart/src/controllers/MyTasksController.dart';
import 'package:b_smart/src/statemanagment/StateProvider.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:b_smart/src/widgets/TaskCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class MyTasks extends StatefulWidget {
  createState() => MyTasksView();
}

class MyTasksView extends StateMVC<MyTasks> {
  MyTasksView() : super(MyTasksController()) {
    _myTasksController = MyTasksController.con;
  }
  MyTasksController _myTasksController;
  bool isLoading = false;
  @override
  void initState() {
    isLoading = true;
    _myTasksController.getTasksList("new").then((value) {
      if (value == true) {
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });

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
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: provState.newButton == false
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, right: 4),
                                  child: InkWell(
                                    child: Container(
                                      width: size.width / 3.5,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Color(0xff5bc0de),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "_new".tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.white,
                                              size: provState.state == "new"
                                                  ? 25
                                                  : 0,
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
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50),
                                  child: CircularProgressIndicator(
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                  ),
                                )),
                      provState.rejictedButton == false
                          ? InkWell(
                              child: Container(
                                width: size.width / 3.5,
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
                                        "_rejected".tr(),
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
                                  width: size.width / 3.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xff5cb85c),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "_approved".tr(),
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
              isLoading == false
                  ? _myTasksController.tasksList.length == 0
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
                          itemCount: _myTasksController.tasksList.length,
                          shrinkWrap: true,
                          reverse: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return TaskCard(
                                data: _myTasksController.tasksList[index]);
                          })
                  : Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Theme.of(context).backgroundColor,
                        ),
                      ),
                    )
            ],
          ),
        ));
  }
}
