import 'dart:convert';

LoanTypeModel loanTypeModelFromJson(String str) =>
    LoanTypeModel.fromJson(json.decode(str));

String loanTypeModelToJson(LoanTypeModel data) => json.encode(data.toJson());

class LoanTypeModel {
  LoanTypeModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory LoanTypeModel.fromJson(Map<String, dynamic> json) => LoanTypeModel(
        id: json["id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
      };
}
