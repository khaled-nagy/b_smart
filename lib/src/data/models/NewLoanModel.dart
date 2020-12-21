// To parse this JSON data, do
//
//     final newLoanModel = newLoanModelFromJson(jsonString);

import 'dart:convert';

NewLoanModel newLoanModelFromJson(String str) =>
    NewLoanModel.fromJson(json.decode(str));

String newLoanModelToJson(NewLoanModel data) => json.encode(data.toJson());

class NewLoanModel {
  NewLoanModel({
    this.code,
    this.companyId,
    this.transactionDate,
    this.employeeId,
    this.loanTypeId,
    this.value,
    this.installmentsCount,
    this.installmentValue,
    this.startMonth,
    this.startYear,
    this.endMonth,
    this.endYear,
    this.notes,
    this.referenceKey,
    this.referenceType,
    this.migrationTransactionId,
    this.installments,
    this.requestType,
    this.workflowRequestId,
    this.isActive,
    this.isLocked,
    this.isDeleted,
    this.id,
    this.tags,
    this.attachmentsCount,
  });

  String code;
  dynamic companyId;
  DateTime transactionDate;
  int employeeId;
  int loanTypeId;
  double value;
  int installmentsCount;
  double installmentValue;
  int startMonth;
  int startYear;
  int endMonth;
  int endYear;
  dynamic notes;
  dynamic referenceKey;
  dynamic referenceType;
  dynamic migrationTransactionId;
  List<dynamic> installments;
  String requestType;
  dynamic workflowRequestId;
  bool isActive;
  bool isLocked;
  bool isDeleted;
  int id;
  dynamic tags;
  int attachmentsCount;

  factory NewLoanModel.fromJson(Map<String, dynamic> json) => NewLoanModel(
        code: json["code"],
        companyId: json["companyId"],
        transactionDate: DateTime.parse(json["transactionDate"]),
        employeeId: json["employeeId"],
        loanTypeId: json["loanTypeId"],
        value: json["value"],
        installmentsCount: json["installmentsCount"],
        installmentValue: json["installmentValue"],
        startMonth: json["startMonth"],
        startYear: json["startYear"],
        endMonth: json["endMonth"],
        endYear: json["endYear"],
        notes: json["notes"],
        referenceKey: json["referenceKey"],
        referenceType: json["referenceType"],
        migrationTransactionId: json["migrationTransactionId"],
        installments: List<dynamic>.from(json["installments"].map((x) => x)),
        requestType: json["requestType"],
        workflowRequestId: json["workflowRequestId"],
        isActive: json["isActive"],
        isLocked: json["isLocked"],
        isDeleted: json["isDeleted"],
        id: json["id"],
        tags: json["tags"],
        attachmentsCount: json["attachmentsCount"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "companyId": companyId,
        "transactionDate": transactionDate.toIso8601String(),
        "employeeId": employeeId,
        "loanTypeId": loanTypeId,
        "value": value,
        "installmentsCount": installmentsCount,
        "installmentValue": installmentValue,
        "startMonth": startMonth,
        "startYear": startYear,
        "endMonth": endMonth,
        "endYear": endYear,
        "notes": notes,
        "referenceKey": referenceKey,
        "referenceType": referenceType,
        "migrationTransactionId": migrationTransactionId,
        "installments": List<dynamic>.from(installments.map((x) => x)),
        "requestType": requestType,
        "workflowRequestId": workflowRequestId,
        "isActive": isActive,
        "isLocked": isLocked,
        "isDeleted": isDeleted,
        "id": id,
        "tags": tags,
        "attachmentsCount": attachmentsCount,
      };
}
