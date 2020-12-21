// To parse this JSON data, do
//
//     final newassignmentChangeModel = newassignmentChangeModelFromJson(jsonString);

import 'dart:convert';

NewassignmentChangeModel newassignmentChangeModelFromJson(String str) =>
    NewassignmentChangeModel.fromJson(json.decode(str));

String newassignmentChangeModelToJson(NewassignmentChangeModel data) =>
    json.encode(data.toJson());

class NewassignmentChangeModel {
  NewassignmentChangeModel({
    this.code,
    this.companyId,
    this.transactionDate,
    this.employeeId,
    this.effectDate,
    this.oldLocationId,
    this.newLocationId,
    this.oldDepartmentId,
    this.newDepartmentId,
    this.oldPositionId,
    this.newPositionId,
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
  DateTime effectDate;
  dynamic oldLocationId;
  dynamic newLocationId;
  dynamic oldDepartmentId;
  dynamic newDepartmentId;
  dynamic oldPositionId;
  dynamic newPositionId;
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

  factory NewassignmentChangeModel.fromJson(Map<String, dynamic> json) =>
      NewassignmentChangeModel(
        code: json["code"],
        companyId: json["companyId"],
        transactionDate: DateTime.parse(json["transactionDate"]),
        employeeId: json["employeeId"],
        effectDate: DateTime.parse(json["effectDate"]),
        oldLocationId: json["oldLocationId"],
        newLocationId: json["newLocationId"],
        oldDepartmentId: json["oldDepartmentId"],
        newDepartmentId: json["newDepartmentId"],
        oldPositionId: json["oldPositionId"],
        newPositionId: json["newPositionId"],
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
        "effectDate": effectDate.toIso8601String(),
        "oldLocationId": oldLocationId,
        "newLocationId": newLocationId,
        "oldDepartmentId": oldDepartmentId,
        "newDepartmentId": newDepartmentId,
        "oldPositionId": oldPositionId,
        "newPositionId": newPositionId,
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
