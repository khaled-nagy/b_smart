import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/UserLocalStorage.dart';
import 'package:b_smart/src/data/models/UserModel.dart';

import 'package:b_smart/src/data/repository/UserRebository.dart';
import 'package:http/http.dart' as http;

class UserService extends UserRebository {
  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String pass) async {
    String url = "${ConstantVarable.baseUrl}/api/login";
    print(url);
    return await http
        .post(url, body: {"email": email, "password": pass}).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);
        ConstantVarable.accessToken = jsonValue["access_token"];
        ConstantVarable.loginError = jsonValue["error"];

        UserLocalStorage().saveToken(jsonValue["access_token"]).then((value) {
          if (value == true) {
            print("تم تخزين ال token بنجاح");
          } else {
            print("فشل التخزين");
          }
        });

        print(jsonValue);
        print(ConstantVarable.accessToken);
        print(ConstantVarable.loginError);
        return UserModel.fromJson(jsonValue["Data"]);
      } else {
        var jsonValue = jsonDecode(response.body);
        return UserModel.fromJson(jsonValue);
      }
    });
  }

  @override
  Future<UserModel> regNewUser(String role, String fName, String lName,
      String email, String phone, String cityId, String pass) async {
    String url = ConstantVarable.baseUrl + "/api/register";
    print(url);
    print(role);
    return await http.post(
      url,
      body: {
        "role": role,
        "fname": fName,
        "lname": lName,
        "email": email,
        "phone": phone,
        "city_id": cityId,
        "password": pass,
      },
    ).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);
        print(jsonValue);
        return UserModel.fromJson(jsonValue);
      } else {
        var jsonValue = jsonDecode(response.body);
        print(jsonValue);
        return UserModel.fromJson(jsonValue);
      }
    });
  }

  @override
  Future<bool> updateUser(String fName, String lName, String email,
      String phone, String cityId) async {
    String url = "${ConstantVarable.baseUrl}/api/updateProfileData";
    print(url);
    print("token is : ${ConstantVarable.accessToken}");
    UserLocalStorage().getToken().then((token) {
      ConstantVarable.accessToken = token;
    });
    return await http.post(url, body: {
      "fname": fName,
      "lname": lName,
      "email": email,
      "phone": phone,
      "city_id": cityId,
    }, headers: {
      "Authorization": "Bearer ${ConstantVarable.accessToken}",
      "Accept": "application/json"
    }).then((response) {
      print("status code is : ${response.statusCode}");
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);
        print(jsonValue);
        print("true");

        return true;
      } else {
        print("false");
        return false;
      }
    });
  }
}
