// To parse this JSON data, do
//
//     final newRequestModel = newRequestModelFromJson(jsonString);

import 'dart:convert';

NewVacationModel newVacationModelFromJson(String str) =>
    NewVacationModel.fromJson(json.decode(str));

String newVacationModelToJson(NewVacationModel data) =>
    json.encode(data.toJson());

class NewVacationModel {
  NewVacationModel({
    this.code,
    this.companyId,
    this.transactionDate,
    this.employeeId,
    this.employeeCode,
    this.employeeLocalName,
    this.employeeForeignName,
    this.vacationTypeId,
    this.numberOfDays,
    this.balanceBeforeTransaction,
    this.balanceAfterTransaction,
    this.startDate,
    this.endDate,
    this.returnDate,
    this.startTime,
    this.endTime,
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
  dynamic employeeCode;
  dynamic employeeLocalName;
  dynamic employeeForeignName;
  int vacationTypeId;
  double numberOfDays;
  double balanceBeforeTransaction;
  double balanceAfterTransaction;
  String startDate;
  String endDate;
  String returnDate;
  dynamic startTime;
  dynamic endTime;
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

  factory NewVacationModel.fromJson(Map<String, dynamic> json) =>
      NewVacationModel(
        code: json["code"],
        companyId: json["companyId"],
        transactionDate: DateTime.parse(json["transactionDate"]),
        employeeId: json["employeeId"],
        employeeCode: json["employeeCode"],
        employeeLocalName: json["employeeLocalName"],
        employeeForeignName: json["employeeForeignName"],
        vacationTypeId: json["vacationTypeId"],
        numberOfDays: json["numberOfDays"],
        balanceBeforeTransaction: json["balanceBeforeTransaction"],
        balanceAfterTransaction: json["balanceAfterTransaction"],
        startDate: json["startDate"] == null ? "" : json["startDate"],
        endDate: json["endDate"] == null ? "" : json["endDate"],
        returnDate: json["returnDate"] == null ? "" : json["returnDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
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
        "employeeCode": employeeCode,
        "employeeLocalName": employeeLocalName,
        "employeeForeignName": employeeForeignName,
        "vacationTypeId": vacationTypeId,
        "numberOfDays": numberOfDays,
        "balanceBeforeTransaction": balanceBeforeTransaction,
        "balanceAfterTransaction": balanceAfterTransaction,
        "startDate": startDate,
        "endDate": endDate,
        "returnDate": returnDate,
        "startTime": startTime,
        "endTime": endTime,
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
