import 'package:b_smart/src/controllers/MyRequestController.dart';
import 'package:b_smart/src/screens/RequestDetailes_Screen.dart';
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
        body: ListView(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
               return   MyRequestDetailes();
                 }));
              },
                          child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),


                  child: Container(
                  
                    height: 140.0,
                width: size.width*0.8,
                  child: ListTile(
                    leading:  Column(
                      children: [
                        SizedBox(height: 5.0,),
                        Image.asset("assets/imgs/request.png",height: 50.0,),
                      ],
                    ),
                    title: Text("Vacation Request",style: TextStyle(fontSize:18 ),),
                    subtitle: Column(
                      children: [
                         SizedBox(height: 20.0, ),
                        Text("Code:"+"#30",style: TextStyle(color: Colors.grey,)),
                        SizedBox(height: 20.0, ),
                        Text("May.10.2020"+" (5:00 PM)")
                      ],
                    ),
                    trailing: Column(
                      children: [
                          
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.green,
                          ),
                          child:Container(
                            height: 38.0,width: size.width*0.3,
                            child: Center(child: Text("Approved",style: TextStyle(color: Colors.white,fontSize: 18),))) ,
                        ),
                      ],
                    ),
                    
                  ),
                )),
              ),
            ),  
          ],
        ),
        // body:SingleChildScrollView(
        //           child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(10.0),
        //         child: new Text("My Requests",style: Theme.of(context).textTheme.headline2,),
        //       ), 
        //        Padding(
        //          padding: const EdgeInsets.all(11.0),
        //          child: Container(
                   
        //            child: new Text("Request Code : 20",style: Theme.of(context).textTheme.bodyText1,),alignment:Alignment.topLeft,),
        //        ),Divider(thickness: 1.2,),
        //          Padding(
        //            padding: const EdgeInsets.all(11.0),
        //            child: Container(child: new Text("Request Type : ahmed gamal mohamed",style: Theme.of(context).textTheme.bodyText1),alignment:Alignment.topLeft,),
        //          ),Divider(thickness: 1.2,),
        //            Padding(
        //              padding: const EdgeInsets.all(11.0),
        //              child: Container(child: new Text("Request Date : 1.20/10/1.201.20",style: Theme.of(context).textTheme.bodyText1),alignment:Alignment.topLeft,),
        //            ),Divider(thickness: 1.2,),
        //              Padding(
        //                padding: const EdgeInsets.all(11.0),
        //                child: Container(child: new Text("Request State : Objected",style: Theme.of(context).textTheme.bodyText1),alignment:Alignment.topLeft,),
        //              ),
        //             Divider(thickness: 1.2,),
            
        //          Padding(
        //            padding: const EdgeInsets.all(15),
        //            child: ButtonW(

        //              color: Theme.of(context).backgroundColor,
        //              text: "View Request Details",
        //              textstyle: Theme.of(context).textTheme.headline1,
        //            ),
        //          )
        //       // new Row(
        //       //   children: [
        //       //        SizedBox(width: size.width*0.025,),
        //       //     Text("Request Code"),
        //       //     Container(height:size.height ,width:size.width*0.002 ,color: Colors.black,),
        //       //     SizedBox(width: size.width*0.05,),
        //       //     Text("Request Type"),
        //       //        SizedBox(width: size.width*0.05,),
        //       //     Text("Request Date"),
        //       //        SizedBox(width: size.width*0.05,),
        //       //     Text("Current State")
        //       //   ],
        //       // )
        //     ],
        //   ),
        // ) ,
      );
  }
      
    }