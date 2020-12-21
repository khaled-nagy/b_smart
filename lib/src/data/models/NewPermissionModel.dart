// To parse this JSON data, do
//
//     final newPermissionModel = newPermissionModelFromJson(jsonString);

import 'dart:convert';

NewPermissionModel newPermissionModelFromJson(String str) =>
    NewPermissionModel.fromJson(json.decode(str));

String newPermissionModelToJson(NewPermissionModel data) =>
    json.encode(data.toJson());

class NewPermissionModel {
  NewPermissionModel({
    this.code,
    this.companyId,
    this.transactionDate,
    this.employeeId,
    this.permissionTypeId,
    this.permissionDate,
    this.repetitionInMonth,
    this.startTime,
    this.endTime,
    this.duration,
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
  int permissionTypeId;
  String permissionDate;
  dynamic repetitionInMonth;
  String startTime;
  String endTime;
  int duration;
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

  factory NewPermissionModel.fromJson(Map<String, dynamic> json) =>
      NewPermissionModel(
        code: json["code"],
        companyId: json["companyId"],
        transactionDate: json["transactionDate"],
        employeeId: json["employeeId"],
        permissionTypeId: json["permissionTypeId"],
        permissionDate: json["permissionDate"],
        repetitionInMonth: json["repetitionInMonth"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        duration: json["duration"],
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
        "permissionTypeId": permissionTypeId,
        "permissionDate": permissionDate,
        "repetitionInMonth": repetitionInMonth,
        "startTime": startTime,
        "endTime": endTime,
        "duration": duration,
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
