import 'dart:convert';

PositionModel positionModelFromJson(String str) =>
    PositionModel.fromJson(json.decode(str));

String positionModelToJson(PositionModel data) => json.encode(data.toJson());

class PositionModel {
  PositionModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory PositionModel.fromJson(Map<String, dynamic> json) => PositionModel(
        id: json["id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
}
