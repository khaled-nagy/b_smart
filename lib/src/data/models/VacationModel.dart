import 'dart:convert';

VacationModel vacationModelFromJson(String str) =>
    VacationModel.fromJson(json.decode(str));

String vacationModelToJson(VacationModel data) => json.encode(data.toJson());

class VacationModel {
  VacationModel({this.id, this.localName, this.foreignName});

  int id;
  String localName;
  String foreignName;

  factory VacationModel.fromJson(Map<String, dynamic> json) => VacationModel(
      id: json["id"],
      localName: json["localName"],
      foreignName: json["foreignName"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "localName": localName, "foreignName": foreignName};
}
