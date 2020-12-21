// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.companyId,
    this.senderId,
    this.senderName,
    this.recieverId,
    this.notificationDate,
    this.title,
    this.message,
    this.data,
    this.isNew,
    this.id,
  });

  int companyId;
  int senderId;
  String senderName;
  int recieverId;
  DateTime notificationDate;
  String title;
  String message;
  String data;
  bool isNew;
  int id;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        companyId: json["companyId"],
        senderId: json["senderId"],
        senderName: json["senderName"],
        recieverId: json["recieverId"],
        notificationDate: DateTime.parse(json["notificationDate"]),
        title: json["title"],
        message: json["message"],
        data: json["data"],
        isNew: json["isNew"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "senderId": senderId,
        "senderName": senderName,
        "recieverId": recieverId,
        "notificationDate": notificationDate.toIso8601String(),
        "title": title,
        "message": message,
        "data": data,
        "isNew": isNew,
        "id": id,
      };
}
