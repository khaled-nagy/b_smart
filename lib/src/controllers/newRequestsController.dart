import 'package:b_smart/src/statemanagment/selectRequestType.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewRequestsController extends ControllerMVC {
  factory NewRequestsController() {
    if (_this == null) _this = NewRequestsController._();
    return _this;
  }
  static NewRequestsController _this;

  NewRequestsController._();

  static NewRequestsController get con => _this;
  check (){
    
  }
}
