import 'package:flutter/material.dart';

class NotificationCounter extends ChangeNotifier {
  int counter = 0;

  notificationCounter(int noitificationCount) {
    this.counter = noitificationCount;
    notifyListeners();
  }
}
