import 'package:flutter/material.dart';

class SelectRequest extends ChangeNotifier {
  String _requestType = "";
  String get requesttype {
    return _requestType;
  }

  set requesttype(String type) {
    this._requestType = type;
    notifyListeners();
  }
}
