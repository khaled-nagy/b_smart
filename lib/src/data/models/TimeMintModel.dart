// To parse this JSON data, do
//
//     final cityMenu = cityMenuFromJson(jsonString);

import 'dart:convert';

TimeMintModel cityMenuFromJson(String str) =>
    TimeMintModel.fromJson(json.decode(str));

String cityMenuToJson(TimeMintModel data) => json.encode(data.toJson());

class TimeMintModel {
  TimeMintModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory TimeMintModel.fromJson(Map<String, dynamic> json) => TimeMintModel(
        id: json["id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
}
