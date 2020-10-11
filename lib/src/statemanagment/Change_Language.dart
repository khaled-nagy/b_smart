import 'package:flutter/material.dart';


    class ChangeLanguage  extends ChangeNotifier {
        String _language ;
        String get language {
          return _language;
        }
        set language (type){
       this._language = type;
       notifyListeners();
        }
    }