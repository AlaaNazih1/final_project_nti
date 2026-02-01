import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = Locale('en');
  Locale get locale => _locale;
  void changeLanguage(String e) {
    _locale = Locale(e);
    notifyListeners();
  }
}
