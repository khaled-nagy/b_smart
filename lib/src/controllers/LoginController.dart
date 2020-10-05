import 'package:mvc_pattern/mvc_pattern.dart';

class LoginController extends ControllerMVC {
  //to make single instance of class
  factory LoginController() {
    if (_this == null) _this = LoginController._();
    return _this;
  }
  static LoginController _this;

  LoginController._();

  static LoginController get con => _this;
}
