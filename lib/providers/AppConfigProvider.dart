import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en'; // Todo:read this value from sharedprefences
  ThemeMode appTheme =
      ThemeMode.light; //  Todo:read this value from sharedprefences
  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  void changeTheme(ThemeMode newMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (newMode == appTheme) return;
    prefs.setString('theme', newMode == ThemeMode.light ? 'light' : 'dark');
    appTheme = newMode;
    //Todo:Save this value to sharedprefences
    notifyListeners();
  }

  void changeLanguage(String langCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (langCode == appLanguage) return;
    prefs.setString('language', langCode);
    //Todo:Save this value to sharedprefences
    appLanguage = langCode;
    notifyListeners();
  }
}
