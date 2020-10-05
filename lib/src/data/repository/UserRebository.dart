import 'package:b_smart/src/data/models/UserModel.dart';

abstract class UserRebository {
  Future<UserModel> signInWithEmailAndPassword(String email, String pass);
  Future<UserModel> regNewUser(String role, String fName, String lName,
      String email, String phone, String cityId, String pass);
  Future<bool> updateUser(
      String fName, String lName, String email, String phone, String cityId);
}
