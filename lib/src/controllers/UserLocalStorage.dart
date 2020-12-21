import 'package:b_smart/src/data/models/SettingsModel.dart';
import 'package:b_smart/src/data/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalStorage {
  Future<bool> saveClient(UserModel user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setInt("id", user.id);
      await prefs.setString("userName", user.userName);
      await prefs.setString("accessToken", user.accessToken);
      await prefs.setString("email", user.email);
      await prefs.setString("role", user.role);
      await prefs.setString("phone", user.mobile);

      //await prefs.setString("imgPath", user.);

      return true;
    } catch (Excption) {
      return false;
    }
  }

  Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return new UserModel(
        id: prefs.getInt("id"),
        userName: prefs.getString("userName"),
        accessToken: prefs.getString("accessToken"),
        email: prefs.getString("email"),
        role: prefs.getString("role"),
        mobile: prefs.getString("phone"));
  }

  Future<bool> saveUserTextField(String username) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", username);

      return true;
    } catch (Excption) {
      return false;
    }
  }

  Future<String> getUserTextField() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString("username");
    return username;
  }

  Future<bool> saveSettings(SettingModel setting) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString("userName_finger", setting.userName);
      await prefs.setString("pass_finger", setting.pass);
      await prefs.setBool("finger", setting.finger);

      return true;
    } catch (Excption) {
      return false;
    }
  }

  Future<SettingModel> getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return new SettingModel(
      userName: prefs.getString("userName_finger"),
      pass: prefs.getString("pass_finger"),
      finger: prefs.getBool("finger"),
    );
  }

  Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }
}
