import 'dart:convert';

YearModel yearModelFromJson(String str) => YearModel.fromJson(json.decode(str));

String yearModelToJson(YearModel data) => json.encode(data.toJson());

class YearModel {
  YearModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory YearModel.fromJson(Map<String, dynamic> json) => YearModel(
        id: json["id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
}
