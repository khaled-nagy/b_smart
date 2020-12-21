import 'dart:convert';

MonthModel monthModelFromJson(String str) =>
    MonthModel.fromJson(json.decode(str));

String monthModelToJson(MonthModel data) => json.encode(data.toJson());

class MonthModel {
  MonthModel({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory MonthModel.fromJson(Map<String, dynamic> json) => MonthModel(
        id: json["id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
}
