import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectRequest extends ChangeNotifier {
  String _requestType;
    String  get requesttype   {
         return _requestType;
  }
  set requesttype(String type) {
             this._requestType = type;
             notifyListeners();
  }
 
}
