// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

SettingModel settingModelFromJson(String str) =>
    SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  SettingModel({
    this.userName,
    this.pass,
    this.finger,
  });

  String userName;
  String pass;
  bool finger;

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        userName: json["userName"],
        pass: json["pass"],
        finger: json["finger"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "pass": pass,
        "finger": finger,
      };
}
