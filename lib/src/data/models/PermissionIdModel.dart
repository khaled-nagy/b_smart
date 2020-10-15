


import 'dart:convert';

PermissionIdModel permissionIdModelFromJson(String str) => PermissionIdModel.fromJson(json.decode(str));

String permissionIdModelToJson(PermissionIdModel data) => json.encode(data.toJson());

class PermissionIdModel {
      String name;
      String id;
      PermissionIdModel({this.name,this.id});
      factory PermissionIdModel.fromJson(Map <String,dynamic> jsondata)=>
      PermissionIdModel(
        name: jsondata["name"],
        id: jsondata["id"]
      );
      
  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
}