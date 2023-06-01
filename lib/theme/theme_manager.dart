import 'package:flutter/material.dart';

bool themeMode = true;

class ThemeManager with ChangeNotifier {
  bool changeTheme(bool actual) {
    actual = !actual;
    themeMode = actual;
    notifyListeners();
    return actual;
  }

  bool getActualMode() {
    return themeMode;
  }
}
