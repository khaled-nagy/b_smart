import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLanguage extends ChangeNotifier {
  String lang;
  BuildContext context;

  void language(type, context) {
    this.lang = type.toString();
    switch (type.toString()) {
      case "ar":
        {
          log(type.toString(), name: toString());
          EasyLocalization.of(context).locale = type;
          break;
        }
      case "en":
        {
          log(type.toString(), name: toString());
          EasyLocalization.of(context).locale = type;
          break;
        }
    }
    notifyListeners();
  }
}
