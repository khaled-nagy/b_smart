import 'package:b_smart/src/controllers/MyTasksController.dart';
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
    _myrequestcontroller = MyTasksController.con;
  }
  MyTasksController _myrequestcontroller;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context: context),

            body: new ListView(
              children: [
                new Card()
              ],
            ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: new Text(
      //           "My Tasks",
      //           style: Theme.of(context).textTheme.headline2,
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(11.0),
      //         child: Container(
      //           child: new Text(
      //             "Request Code : 20",
      //             style: Theme.of(context).textTheme.bodyText1,
      //           ),
      //           alignment: Alignment.topLeft,
      //         ),
      //       ),
      //       Divider(
      //         thickness: 1.2,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(11.0),
      //         child: Container(
      //           child: new Text("Request Type : ahmed gamal mohamed",
      //               style: Theme.of(context).textTheme.bodyText1),
      //           alignment: Alignment.topLeft,
      //         ),
      //       ),
      //       Divider(
      //         thickness: 1.2,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(11.0),
      //         child: Container(
      //           child: new Text("Request Date : 1.20/10/1.201.20",
      //               style: Theme.of(context).textTheme.bodyText1),
      //           alignment: Alignment.topLeft,
      //         ),
      //       ),
      //       Divider(
      //         thickness: 1.2,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(11.0),
      //         child: Container(
      //           child: new Text("Empolyee : Khaled",
      //               style: Theme.of(context).textTheme.bodyText1),
      //           alignment: Alignment.topLeft,
      //         ),
      //       ),
      //       Divider(
      //         thickness: 1.2,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(11.0),
      //         child: Container(
      //           child: new Text("Status : New",
      //               style: Theme.of(context).textTheme.bodyText1),
      //           alignment: Alignment.topLeft,
      //         ),
      //       ),
      //       Divider(
      //         thickness: 1.2,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(11.0),
      //         child: Container(
      //           child: new Text("Notes : Fine",
      //               style: Theme.of(context).textTheme.bodyText1),
      //           alignment: Alignment.topLeft,
      //         ),
      //       ),
      //       Divider(
      //         thickness: 1.2,
      //       ),
      //       new SizedBox(
      //         height: 20,
      //       ),

      //       new Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           ButtonW(
      //             borderradius: BorderRadius.circular(10),
      //             width: size.width * 0.3,
      //             height: 40,
      //             color: Theme.of(context).backgroundColor,
      //             text: "View",
      //             textstyle: Theme.of(context).textTheme.headline1,
      //           ),
      //           ButtonW(
      //             borderradius: BorderRadius.circular(10),
      //             width: size.width * 0.3,
      //             height: 40,
      //             color: Colors.green,
      //             text: "Approved",
      //             textstyle: Theme.of(context).textTheme.headline1,
      //           ),
      //           ButtonW(
      //             borderradius: BorderRadius.circular(10),
      //             width: size.width * 0.3,
      //             height: 40,
      //             color: Colors.red,
      //             text: "Reject",
      //             textstyle: Theme.of(context).textTheme.headline1,
      //           ),
      //         ],
      //       ),

           
      //     ],
      //   ),
      // ),
    );
  }
}
