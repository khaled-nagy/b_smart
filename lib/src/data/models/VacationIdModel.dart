import 'dart:convert';
    
           

VacationIdModel vacationModelFromJson(String str) => VacationIdModel.fromjson(json.decode(str));

String vacationModeltoJson(VacationIdModel data) => json.encode(data.toJson());

   class VacationIdModel {
        String name;
        String id;
        VacationIdModel({this.id,this.name});
        factory VacationIdModel.fromjson(Map <String,dynamic>jsondata )=>
        VacationIdModel(
          id: jsondata["id"],
          name: jsondata["name"]
        );
 
       
         Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
   }