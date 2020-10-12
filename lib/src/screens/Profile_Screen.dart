import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:b_smart/src/controllers/Profile_controller.dart';

class MyProfile extends StatefulWidget {
  @override
  createState() => MyProfileView();
}

class MyProfileView extends StateMVC<MyProfile> {
  MyProfileView() : super(ProfileController()) {
    _profileController = ProfileController.con;
  }
  ProfileController _profileController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        title: Text("My Profile"),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            new Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              height: 280,
              width: size.width,
              child: Container(
                width: size.width * 0.2,
                child: ClipOval(
                  child: Icon(
                    Icons.supervised_user_circle_rounded,
                    size: 150,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 205),
              child: Center(
                  child: new Container(
                child: Text(
                  "Ahmed Gamal",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 245),
                child: Center(
                  child: Container(
                      width: size.width / 1.2,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sales Manager",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Text(
                                "Advertising department",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ],
                          ),
                        ),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 340),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.code),
                  title: Text("Code:"),
                  subtitle: Text("#0221020210"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 435),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.data_usage),
                  title: Text("Hire Data:"),
                  subtitle: Text("Test"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 535),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text("Location:"),
                  subtitle: Text("6th,October,Giza,Egypt"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 635),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.dashboard_customize),
                  title: Text("Documents:"),
                  subtitle: Text("Test"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
