import 'dart:convert';

PayItemModel payItemModelFromJson(String str) =>
    PayItemModel.fromJson(json.decode(str));

String payItemModelToJson(PayItemModel data) => json.encode(data.toJson());

class PayItemModel {
  PayItemModel({this.id, this.localName, this.foreignName});

  int id;
  String localName;
  String foreignName;

  factory PayItemModel.fromJson(Map<String, dynamic> json) => PayItemModel(
      id: json["id"],
      localName: json["localName"],
      foreignName: json["foreignName"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "localName": localName, "foreignName": foreignName};
}
