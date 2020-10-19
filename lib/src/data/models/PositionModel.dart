import 'dart:convert';

PositionModel positionModelFromJson(String str) =>
    PositionModel.fromJson(json.decode(str));

String positionModelToJson(PositionModel data) => json.encode(data.toJson());

class PositionModel {
  PositionModel({this.id, this.localName, this.foreignName});

  int id;
  String localName;
  String foreignName;

  factory PositionModel.fromJson(Map<String, dynamic> json) => PositionModel(
      id: json["id"],
      localName: json["localName"],
      foreignName: json["foreignName"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "localName": localName, "foreignName": foreignName};
}
