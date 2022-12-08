import 'package:flutter/material.dart';

ThemeMode getThemeMode(String type) {
  ThemeMode themeMode = ThemeMode.system;
  switch (type) {
    case 'Dark':
      themeMode = ThemeMode.dark;
      break;
    case 'Light':
      themeMode = ThemeMode.light;
      break;
  }
  return themeMode;
}

final List<String> themeModes = <String>['Dark', 'Light'];
const String defaultLanguage = 'french';
const String defaultTheme = 'System';
