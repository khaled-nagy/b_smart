import 'dart:convert';

PermissionModel permissionModelFromJson(String str) =>
    PermissionModel.fromJson(json.decode(str));

String permissionModelToJson(PermissionModel data) =>
    json.encode(data.toJson());

class PermissionModel {
  PermissionModel({this.id, this.localName, this.foreignName});

  int id;
  String localName;
  String foreignName;

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      PermissionModel(
          id: json["id"],
          localName: json["localName"],
          foreignName: json["foreignName"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "localName": localName, "foreignName": foreignName};
}
