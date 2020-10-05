// To parse this JSON data, do
//
//     final cityMenu = cityMenuFromJson(jsonString);

import 'dart:convert';

DayModel cityMenuFromJson(String str) => DayModel.fromJson(json.decode(str));

String cityMenuToJson(DayModel data) => json.encode(data.toJson());

class DayModel {
  DayModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
        id: json["id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
}
