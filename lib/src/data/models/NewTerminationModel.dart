// To parse this JSON data, do
//
//     final newTerminationModel = newTerminationModelFromJson(jsonString);

import 'dart:convert';

NewTerminationModel newTerminationModelFromJson(String str) =>
    NewTerminationModel.fromJson(json.decode(str));

String newTerminationModelToJson(NewTerminationModel data) =>
    json.encode(data.toJson());

class NewTerminationModel {
  NewTerminationModel({
    this.code,
    this.companyId,
    this.transactionDate,
    this.employeeId,
    this.terminationTypeId,
    this.requestDate,
    this.lastWorkingDay,
    this.vacationBalance,
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
  String transactionDate;
  int employeeId;
  int terminationTypeId;
  String requestDate;
  String lastWorkingDay;
  dynamic vacationBalance;
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

  factory NewTerminationModel.fromJson(Map<String, dynamic> json) =>
      NewTerminationModel(
        code: json["code"],
        companyId: json["companyId"],
        transactionDate: json["transactionDate"],
        employeeId: json["employeeId"],
        terminationTypeId: json["terminationTypeId"],
        requestDate: json["requestDate"],
        lastWorkingDay: json["lastWorkingDay"],
        vacationBalance: json["vacationBalance"],
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
        "transactionDate": transactionDate,
        "employeeId": employeeId,
        "terminationTypeId": terminationTypeId,
        "requestDate": requestDate,
        "lastWorkingDay": lastWorkingDay,
        "vacationBalance": vacationBalance,
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
