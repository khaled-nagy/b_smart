import 'package:b_smart/src/data/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalStorage {
  Future<bool> saveClient(UserModel user) async {
    print("befor save   ${user.email}");
    print("********* FROM THE RESPONSE ********* save   ${user.fName}");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setInt("id", user.id);
      await prefs.setString("fname", user.fName);
      await prefs.setString("lname", user.lName);
      await prefs.setString("email", user.email);
      await prefs.setString("role", user.role);
      await prefs.setString("phone", user.mobile);

      //await prefs.setString("imgPath", user.);
      print("saved data ${user.id}+${user.fName} +${user.email}");
      return true;
    } catch (Excption) {
      print("save to shared faild   :  $Excption");
      return false;
    }
  }

  Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return new UserModel(
        id: prefs.getInt("id"),
        fName: prefs.getString("fname"),
        lName: prefs.getString("lname"),
        email: prefs.getString("email"),
        role: prefs.getString("role"),
        mobile: prefs.getString("phone"));
  }

  Future<bool> saveToken(String token) async {
    print("********* FROM THE RESPONSE ********* save   $token");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);
      print("saved token $token ");
      return true;
    } catch (Excption) {
      print("save to shared faild   :  $Excption");
      return false;
    }
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }

  ///////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////

  // Future<bool> saveSubSctionsInfo(SubSectionsModel subSectionsModel) async {
  //   print("befor save   ${subSectionsModel.id}");
  //   print(
  //       "********* FROM THE RESPONSE ********* save   ${subSectionsModel.name}");
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();

  //     await prefs.setString("id", subSectionsModel.id);
  //     await prefs.setString("Name", subSectionsModel.name);

  //     //await prefs.setString("imgPath", user.);
  //     print("saved data ${subSectionsModel.id}+${subSectionsModel.name} ");
  //     return true;
  //   } catch (Excption) {
  //     print("save to shared faild   :  $Excption");
  //     return false;
  //   }
  // }

  // Future<SubSectionsModel> getSubSctionsInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   return new SubSectionsModel(
  //     id: prefs.getString("id"),
  //     name: prefs.getString("Name"),
  //   );
  // }

  ///////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////

  // Future<bool> saveSctionsInfo(SubSectionsModel sectionsModel) async {
  //   print("befor save   ${sectionsModel.id}");
  //   print("********* FROM THE RESPONSE ********* save   ${sectionsModel.name}");
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();

  //     await prefs.setString("id", sectionsModel.id);
  //     await prefs.setString("Name", sectionsModel.name);

  //     //await prefs.setString("imgPath", user.);
  //     print("saved data ${sectionsModel.id}+${sectionsModel.name} ");
  //     return true;
  //   } catch (Excption) {
  //     print("save to shared faild   :  $Excption");
  //     return false;
  //   }
  // }

  Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }
}
