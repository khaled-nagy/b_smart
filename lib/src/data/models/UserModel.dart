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
      this.fName,
      this.lName,
      this.address,
      this.mobile,
      this.error,
      this.otp,
      this.role});

  int statusCode;
  int id;
  String email;
  String fName;
  String lName;
  String address;
  String mobile;
  String error;
  String otp;
  String role;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      email: json["email"],
      fName: json["fname"],
      lName: json["lname"],
      mobile: json["phone"],
      error: json["error"],
      otp: json["randomCode"],
      role: json["role"],
      statusCode: json["Status Code"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "Status Code": statusCode,
        "email": email,
        "fname": fName,
        "lname": lName,
        "phone": mobile,
        "error": error,
        "randomCode": otp,
        "role": role
      };
}
