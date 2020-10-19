import 'dart:convert';

TerminasionModel terminationModelFromJson(String str) =>
    TerminasionModel.fromJson(json.decode(str));

String terminationModelToJson(TerminasionModel data) =>
    json.encode(data.toJson());

class TerminasionModel {
  TerminasionModel({this.id, this.localName, this.foreignName});

  int id;
  String localName;
  String foreignName;

  factory TerminasionModel.fromJson(Map<String, dynamic> json) =>
      TerminasionModel(
          id: json["id"],
          localName: json["localName"],
          foreignName: json["foreignName"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "localName": localName, "foreignName": foreignName};
}
