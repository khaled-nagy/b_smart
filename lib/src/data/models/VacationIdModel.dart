import 'dart:io';

   class VacationIdModel {
        String name;
        String id;
        VacationIdModel({this.id,this.name});
        factory VacationIdModel.fromjson(Map <String,dynamic>jsondata )=>
        VacationIdModel(
          id: jsondata["id"],
          name: jsondata["name"]
        );
         
       
        
   }