import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage;
  bool mode;
  ThemeMode appTheme;

  AppConfigProvider({required String appLanguage, required bool mode})
      : appLanguage = appLanguage,
        mode = mode,
        appTheme = mode ? ThemeMode.dark : ThemeMode.light;

  /// data that will change

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    saveDataLocalization();
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    mode = appTheme == ThemeMode.dark;
    saveDataLocalization();
    notifyListeners();
  }

  void saveDataLocalization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("appLanguage", appLanguage);
    prefs.setBool("appTheme", mode);
    notifyListeners();
  }

}