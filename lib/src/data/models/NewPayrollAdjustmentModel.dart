// To parse this JSON data, do
//
//     final newPayrollAdjustmentModel = newPayrollAdjustmentModelFromJson(jsonString);

import 'dart:convert';

NewPayrollAdjustmentModel newPayrollAdjustmentModelFromJson(String str) =>
    NewPayrollAdjustmentModel.fromJson(json.decode(str));

String newPayrollAdjustmentModelToJson(NewPayrollAdjustmentModel data) =>
    json.encode(data.toJson());

class NewPayrollAdjustmentModel {
  NewPayrollAdjustmentModel({
    this.code,
    this.companyId,
    this.transactionDate,
    this.employeeId,
    this.employeeCode,
    this.employeeLocalName,
    this.employeeForeignName,
    this.payItemId,
    this.value,
    this.startMonth,
    this.startYear,
    this.endMonth,
    this.endYear,
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
  int payItemId;
  double value;
  int startMonth;
  int startYear;
  int endMonth;
  int endYear;
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

  factory NewPayrollAdjustmentModel.fromJson(Map<String, dynamic> json) =>
      NewPayrollAdjustmentModel(
        code: json["code"],
        companyId: json["companyId"],
        transactionDate: DateTime.parse(json["transactionDate"]),
        employeeId: json["employeeId"],
        employeeCode: json["employeeCode"],
        employeeLocalName: json["employeeLocalName"],
        employeeForeignName: json["employeeForeignName"],
        payItemId: json["payItemId"],
        value: json["value"],
        startMonth: json["startMonth"],
        startYear: json["startYear"],
        endMonth: json["endMonth"],
        endYear: json["endYear"],
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
        "payItemId": payItemId,
        "value": value,
        "startMonth": startMonth,
        "startYear": startYear,
        "endMonth": endMonth,
        "endYear": endYear,
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
