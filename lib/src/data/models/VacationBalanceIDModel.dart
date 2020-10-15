import 'dart:convert';
import 'dart:io';
          

VacationBalanceIdModel vacationBalanceModelFromJson(String str) => VacationBalanceIdModel.fromjson(json.decode(str));

String vacationBalanceModeltoJson(VacationBalanceIdModel data) => json.encode(data.toJson());
   class VacationBalanceIdModel {
        String name;
        String id;
        VacationBalanceIdModel({this.id,this.name});
        factory VacationBalanceIdModel.fromjson(Map <String,dynamic>jsondata )=>
        VacationBalanceIdModel(
          id: jsondata["id"],
          name: jsondata["name"]
        );
         
         Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
       
        
   }