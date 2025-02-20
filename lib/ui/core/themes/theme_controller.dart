// MANAGES THEME MODE AND SAVES IT TO SHARED PREFERENCES

import 'package:flutter/material.dart';
import 'package:client/data/services/shared_preferences_service.dart';

class ThemeController with ChangeNotifier {
  final SharedPreferencesService _sharedPreferencesService;

  ThemeController(this._sharedPreferencesService) {
    _loadTheme();
  }

  ThemeMode _themeMode = ThemeMode.system; // Default theme
  ThemeMode get themeMode => _themeMode;

  Future<void> _loadTheme() async {
    _themeMode = (await _sharedPreferencesService.fetchThemeMode());
    notifyListeners();
  }

  Future<void> toggleTheme(ThemeMode newThemeMode) async {
    _themeMode = newThemeMode;
    await _sharedPreferencesService.saveThemeMode(_themeMode);
    notifyListeners();
  }
}
