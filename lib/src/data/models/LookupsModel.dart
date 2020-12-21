import 'dart:convert';

LookupsModel lookupsModelFromJson(String str) =>
    LookupsModel.fromJson(json.decode(str));

String lookupsModelToJson(LookupsModel data) => json.encode(data.toJson());

class LookupsModel {
  LookupsModel({this.id, this.localName, this.localNameAr, this.foreignName});

  int id;
  String localName;
  String localNameAr;
  String foreignName;

  factory LookupsModel.fromJson(Map<String, dynamic> json) => LookupsModel(
      id: json["id"],
      localName: json["localName"],
      localNameAr: json["localNameAr"],
      foreignName: json["foreignName"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "localName": localName,
        "localNameAr": localNameAr,
        "foreignName": foreignName
      };
}
