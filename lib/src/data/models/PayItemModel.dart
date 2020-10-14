import 'dart:convert';

PayItemModel payItemModelFromJson(String str) =>
    PayItemModel.fromJson(json.decode(str));

String payItemModelToJson(PayItemModel data) => json.encode(data.toJson());

class PayItemModel {
  PayItemModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory PayItemModel.fromJson(Map<String, dynamic> json) => PayItemModel(
        id: json["id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
}
