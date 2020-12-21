import 'dart:convert';

VacationBalanceModel vacationBalanceModelFromJson(String str) =>
    VacationBalanceModel.fromJson(json.decode(str));

String vacationBalanceModelToJson(VacationBalanceModel data) =>
    json.encode(data.toJson());

class VacationBalanceModel {
  VacationBalanceModel({this.id, this.localName, this.foreignName});

  int id;
  String localName;
  String foreignName;

  factory VacationBalanceModel.fromJson(Map<String, dynamic> json) =>
      VacationBalanceModel(
          id: json["id"],
          localName: json["localName"],
          foreignName: json["foreignName"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "localName": localName, "foreignName": foreignName};
}
