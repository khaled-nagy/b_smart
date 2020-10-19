import 'dart:convert';

LoanModel loanModelFromJson(String str) => LoanModel.fromJson(json.decode(str));

String loanModelToJson(LoanModel data) => json.encode(data.toJson());

class LoanModel {
  LoanModel({this.id, this.localName, this.foreignName});

  int id;
  String localName;
  String foreignName;

  factory LoanModel.fromJson(Map<String, dynamic> json) => LoanModel(
      id: json["id"],
      localName: json["localName"],
      foreignName: json["foreignName"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "localName": localName, "foreignName": foreignName};
}
