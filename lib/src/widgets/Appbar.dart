import 'package:b_smart/src/screens/ChangePass_Screen.dart';
import 'package:b_smart/src/screens/Profile_Screen.dart';
import 'package:flutter/material.dart';

Widget appbar({BuildContext context}) {
  var size = MediaQuery.of(context).size;
 
  return AppBar(
    actions: [
      Center(child: Text("Ar")),
      SizedBox(width:size.width*0.05 ,),
      Center(child: Icon(Icons.notifications)),
      SizedBox(width:size.width*0.03 ,),
    ],
    title: Row(
      children: [
        SizedBox(
          width: size.width * 0.2,
        ),
        Container(width:size.width*0.35 ,
          child: DropdownButton(
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
        ),
      ],
    ),
    
    centerTitle: true,
    backgroundColor: Theme.of(context).backgroundColor,
  );
}
