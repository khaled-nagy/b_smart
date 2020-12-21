// To parse this JSON data, do
//
//     final newVacationBalanceModel = newVacationBalanceModelFromJson(jsonString);

import 'dart:convert';

NewVacationBalanceModel newVacationBalanceModelFromJson(String str) =>
    NewVacationBalanceModel.fromJson(json.decode(str));

String newVacationBalanceModelToJson(NewVacationBalanceModel data) =>
    json.encode(data.toJson());

class NewVacationBalanceModel {
  NewVacationBalanceModel({
    this.code,
    this.companyId,
    this.transactionDate,
    this.employeeId,
    this.vacationGroupId,
    this.vacationTypeId,
    this.balanceBeforeTransaction,
    this.year,
    this.value,
    this.balanceAfterTransaction,
    this.notes,
    this.referenceKey,
    this.referenceType,
    this.migrationTransactionId,
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
  int vacationGroupId;
  int vacationTypeId;
  double balanceBeforeTransaction;
  int year;
  double value;
  dynamic balanceAfterTransaction;
  dynamic notes;
  dynamic referenceKey;
  dynamic referenceType;
  dynamic migrationTransactionId;
  String requestType;
  dynamic workflowRequestId;
  bool isActive;
  bool isLocked;
  bool isDeleted;
  int id;
  dynamic tags;
  int attachmentsCount;

  factory NewVacationBalanceModel.fromJson(Map<String, dynamic> json) =>
      NewVacationBalanceModel(
        code: json["code"],
        companyId: json["companyId"],
        transactionDate: DateTime.parse(json["transactionDate"]),
        employeeId: json["employeeId"],
        vacationGroupId: json["vacationGroupId"],
        vacationTypeId: json["vacationTypeId"],
        balanceBeforeTransaction: json["balanceBeforeTransaction"],
        year: json["year"],
        value: json["value"],
        balanceAfterTransaction: json["balanceAfterTransaction"],
        notes: json["notes"],
        referenceKey: json["referenceKey"],
        referenceType: json["referenceType"],
        migrationTransactionId: json["migrationTransactionId"],
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
        "vacationGroupId": vacationGroupId,
        "vacationTypeId": vacationTypeId,
        "balanceBeforeTransaction": balanceBeforeTransaction,
        "year": year,
        "value": value,
        "balanceAfterTransaction": balanceAfterTransaction,
        "notes": notes,
        "referenceKey": referenceKey,
        "referenceType": referenceType,
        "migrationTransactionId": migrationTransactionId,
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
