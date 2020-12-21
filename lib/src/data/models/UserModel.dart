// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {this.statusCode,
      this.id,
      this.email,
      this.userName,
      this.accessToken,
      this.address,
      this.mobile,
      this.error,
      this.otp,
      this.role});

  int statusCode;
  int id;
  String email;
  String userName;
  String accessToken;
  String address;
  String mobile;
  String error;
  String otp;
  String role;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      email: json["email"],
      userName: json["userName"],
      accessToken: json["accessToken"],
      mobile: json["phone"],
      error: json["error"],
      otp: json["randomCode"],
      role: json["role"],
      statusCode: json["Status Code"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "Status Code": statusCode,
        "email": email,
        "userName": userName,
        "accessToken": accessToken,
        "phone": mobile,
        "error": error,
        "randomCode": otp,
        "role": role
      };
}
