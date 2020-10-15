import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/controllers/UserLocalStorage.dart';
import 'package:b_smart/src/data/models/UserModel.dart';

import 'package:b_smart/src/data/repository/UserRebository.dart';
import 'package:http/http.dart' as http;

class UserService extends UserRebository {
  @override
  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      String userName, String pass) async {
    String url = "${ConstantVarable.baseUrl}/api/Auth";
    print(url);
    return await http.post(url,
        body: {"userName": userName, "password": pass}).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);
        ConstantVarable.accessToken = jsonValue["accessToken"];
        ConstantVarable.userName = jsonValue["userName"];

        UserLocalStorage().saveToken(jsonValue["accessToken"]).then((value) {
          if (value == true) {
            print("تم تخزين ال token بنجاح");
          } else {
            print("فشل التخزين");
          }
        });

        print(jsonValue);
        print(ConstantVarable.accessToken);
        print(ConstantVarable.userName);
        return jsonValue;
      } else {
        // var jsonValue = jsonDecode(response.body);

        return {};
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
