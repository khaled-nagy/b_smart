import 'package:b_smart/src/screens/ChangePass_Screen.dart';
import 'package:b_smart/src/screens/Profile_Screen.dart';
import 'package:flutter/material.dart';

Widget appbar({BuildContext context}) {
  var size = MediaQuery.of(context).size;
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text("Ar")),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Icon(Icons.notifications)),
      ),
    ],
    title: Row(
      children: [
        SizedBox(
          width: size.width * 0.2,
        ),
        DropdownButton(
          isDense: false,
          isExpanded: false,
          underline: Container(),
          hint: Text("Ahmed",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0)),
          iconDisabledColor: Theme.of(context).backgroundColor,

          iconEnabledColor: Theme.of(context).backgroundColor,
          //  value: "Ahmed",
          onChanged: (value) {
            value = "Ahmed";
          },
          items: [
            DropdownMenuItem(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return MyProfile();
                    }
                  ));
                },
                child: Text("My Profile")),
              value: "Profile",
            ),
            DropdownMenuItem(
              child: InkWell(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return ChangePassword();
                    }
                  ));
                },
                child: Text("Change Password")),
              value: "ChangePass",
            ),
            DropdownMenuItem(
              child: InkWell(
                
                child: Text("Log Out")),
              value: "LogOut",
            ),
          ],
        ),
      ],
    ),
    // title: InkWell(
    //   onTap: (){
    //      showDialog(context: context,builder:(context){
    //        return AlertDialog(elevation: 0,
    //          title: Text("Ahmed",style: Theme.of(context).textTheme.headline2,),
    //          content: Container(height: 170.0,
    //            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    //              children: [
    //                Padding(
    //                  padding: const EdgeInsets.all(8.0),
    //                  child: Text(". My Profile",style: TextStyle(fontSize: 25.0),),
    //                ),
    //                Padding(
    //                  padding: const EdgeInsets.all(8.0),
    //                  child: Text(". Change Password",style: TextStyle(fontSize: 25.0),),
    //                ),
    //                Padding(
    //                  padding: const EdgeInsets.all(8.0),
    //                  child: Text(". Log Out",style: TextStyle(fontSize: 25.0),),
    //                )
    //              ],
    //            ),
    //          ),actions: [
    //            Padding(
    //              padding: const EdgeInsets.all(15),
    //              child: InkWell(
    //                onTap: (){
    //                  Navigator.pop(context);
    //                },
    //                child: Text("Close",style: TextStyle(color: Colors.red,fontSize: 20.0),)),
    //            )
    //          ],
    //        );
    //      } );
    //   },
    //       child: Text(
    //     "Ahmed",
    //     style: Theme.of(context).textTheme.headline1,
    //   ),
    // ),
    centerTitle: true,
    backgroundColor: Theme.of(context).backgroundColor,
  );
}
