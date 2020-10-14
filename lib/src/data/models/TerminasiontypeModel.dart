import 'dart:convert';

TerminationTypeModel terminationTypeModelFromJson(String str) =>
    TerminationTypeModel.fromJson(json.decode(str));

String terminationTypeModelToJson(TerminationTypeModel data) => json.encode(data.toJson());

class TerminationTypeModel {
  TerminationTypeModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory TerminationTypeModel.fromJson(Map<String, dynamic> json) => TerminationTypeModel(
        id: json["id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
}
