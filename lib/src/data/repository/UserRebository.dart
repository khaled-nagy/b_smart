import 'package:b_smart/src/data/models/UserModel.dart';

abstract class UserRebository {
  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      String email, String pass);

  Future<bool> updateUser(
      String fName, String lName, String email, String phone, String cityId);
}
