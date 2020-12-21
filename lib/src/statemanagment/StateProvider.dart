import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  String state = "new";
  bool newButton = false;
  bool rejictedButton = false;
  bool approvedButton = false;

  void stateType(String type) {
    state = type;
    notifyListeners();
  }

  void newButtonState(bool buttonState) {
    newButton = buttonState;
    notifyListeners();
  }

  void rejictedButtonState(bool buttonState) {
    rejictedButton = buttonState;
    notifyListeners();
  }

  void approvedButtonState(bool buttonState) {
    approvedButton = buttonState;
    notifyListeners();
  }
}
