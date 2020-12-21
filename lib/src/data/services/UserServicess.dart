import 'dart:convert';

import 'package:b_smart/ConstantVarables.dart';
import 'package:b_smart/src/data/models/UserModel.dart';
import 'package:b_smart/src/data/repository/UserRebository.dart';
import 'package:http/http.dart' as http;

class UserService extends UserRebository {
  @override
  Future<UserModel> signInWithEmailAndPassword(
      String userName, String pass) async {
    String url = "${ConstantVarable.baseUrl}/api/Auth";

    return await http.post(url,
        body: {"userName": userName, "password": pass}).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);
        ConstantVarable.accessToken = jsonValue["accessToken"];
        ConstantVarable.userName = jsonValue["userName"];

        return UserModel.fromJson(jsonValue);
      } else {
        // var jsonValue = jsonDecode(response.body);

        return UserModel();
      }
    });
  }
}
