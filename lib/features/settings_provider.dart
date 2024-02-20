import 'package:flutter/material.dart';


class SettingsProvider extends ChangeNotifier {

  // List<Widget> screens = [
  //   const TasksView(),
  //   const SettingsView(),
  // ];

  int currentIndex = 0;

  changeIndex(int index) {

    currentIndex = index;
    notifyListeners();

  }

  ThemeMode currentThemeMode = ThemeMode.light;

  changeTheme(ThemeMode newThemeMode) {
    if (currentThemeMode == newThemeMode) return;

    currentThemeMode = newThemeMode;
    notifyListeners();

  }
  bool isDark() {
    return currentThemeMode == ThemeMode.dark;
  }
}