import 'dart:io';

   class VacationBalanceIdModel {
        String name;
        String id;
        VacationBalanceIdModel({this.id,this.name});
        factory VacationBalanceIdModel.fromjson(Map <String,dynamic>jsondata )=>
        VacationBalanceIdModel(
          id: jsondata["id"],
          name: jsondata["name"]
        );
         
       
        
   }