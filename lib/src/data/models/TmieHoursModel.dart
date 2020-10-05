// To parse this JSON data, do
//
//     final cityMenu = cityMenuFromJson(jsonString);

import 'dart:convert';

TimeHoursModel cityMenuFromJson(String str) =>
    TimeHoursModel.fromJson(json.decode(str));

String cityMenuToJson(TimeHoursModel data) => json.encode(data.toJson());

class TimeHoursModel {
  TimeHoursModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory TimeHoursModel.fromJson(Map<String, dynamic> json) => TimeHoursModel(
        id: json["id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
}
