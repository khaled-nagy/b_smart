import 'package:b_smart/src/data/models/UserModel.dart';

abstract class UserRebository {
  Future<UserModel> signInWithEmailAndPassword(String email, String pass);
}
