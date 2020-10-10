import 'package:b_smart/src/controllers/MyRequestController.dart';
import 'package:b_smart/src/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:b_smart/src/widgets/ButtonW.dart';

    class MyRequest extends StatefulWidget {
        @override
    createState()=> MyRequestView();
    
    }
    class MyRequestView extends StateMVC<MyRequest> {
        MyRequestView() : super( MyRequestController()){
        _myrequestcontroller= MyRequestController.con;
        }
        MyRequestController _myrequestcontroller;
   @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
      return Scaffold(
        appBar:appbar(
          context: context
        ) ,
        body:SingleChildScrollView(
                  child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text("My Requests",style: Theme.of(context).textTheme.headline2,),
              ), 
               Padding(
                 padding: const EdgeInsets.all(11.0),
                 child: Container(
                   
                   child: new Text("Request Code : 20",style: Theme.of(context).textTheme.bodyText1,),alignment:Alignment.topLeft,),
               ),Divider(thickness: 1.2,),
                 Padding(
                   padding: const EdgeInsets.all(11.0),
                   child: Container(child: new Text("Request Type : ahmed gamal mohamed",style: Theme.of(context).textTheme.bodyText1),alignment:Alignment.topLeft,),
                 ),Divider(thickness: 1.2,),
                   Padding(
                     padding: const EdgeInsets.all(11.0),
                     child: Container(child: new Text("Request Date : 1.20/10/1.201.20",style: Theme.of(context).textTheme.bodyText1),alignment:Alignment.topLeft,),
                   ),Divider(thickness: 1.2,),
                     Padding(
                       padding: const EdgeInsets.all(11.0),
                       child: Container(child: new Text("Request State : Objected",style: Theme.of(context).textTheme.bodyText1),alignment:Alignment.topLeft,),
                     ),
                    Divider(thickness: 1.2,),
            
                 Padding(
                   padding: const EdgeInsets.all(15),
                   child: ButtonW(

                     color: Theme.of(context).backgroundColor,
                     text: "View Request Details",
                     textstyle: Theme.of(context).textTheme.headline1,
                   ),
                 )
              // new Row(
              //   children: [
              //        SizedBox(width: size.width*0.025,),
              //     Text("Request Code"),
              //     Container(height:size.height ,width:size.width*0.002 ,color: Colors.black,),
              //     SizedBox(width: size.width*0.05,),
              //     Text("Request Type"),
              //        SizedBox(width: size.width*0.05,),
              //     Text("Request Date"),
              //        SizedBox(width: size.width*0.05,),
              //     Text("Current State")
              //   ],
              // )
            ],
          ),
        ) ,
      );
  }
      
    }