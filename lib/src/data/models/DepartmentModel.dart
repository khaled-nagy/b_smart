import 'dart:convert';

DepartmentModel departmentModelFromJson(String str) =>
    DepartmentModel.fromJson(json.decode(str));

String departmentModelToJson(DepartmentModel data) =>
    json.encode(data.toJson());

class DepartmentModel {
  DepartmentModel({this.id, this.localName, this.foreignName});

  int id;
  String localName;
  String foreignName;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      DepartmentModel(
          id: json["id"],
          localName: json["localName"],
          foreignName: json["foreignName"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "localName": localName, "foreignName": foreignName};
}
