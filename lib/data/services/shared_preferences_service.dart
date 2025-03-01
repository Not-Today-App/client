import 'package:client/utils/results.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const _tokenKey = 'TOKEN';
  final _log = Logger('SharedPreferencesService');

  Future<Result<String?>> fetchToken() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      _log.finer('Got token from SharedPreferences');
      return Result.ok(sharedPreferences.getString(_tokenKey));
    } on Exception catch (e) {
      _log.warning('Failed to get token', e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveToken(String? token) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      if (token == null) {
        _log.finer('Removed token');
        await sharedPreferences.remove(_tokenKey);
      } else {
        _log.finer('Replaced token');
        await sharedPreferences.setString(_tokenKey, token);
      }
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('Failed to set token', e);
      return Result.error(e);
    }
  }

  static const _themeModeKey = 'THEME_MODE';

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(_themeModeKey, themeMode.index);
  }

  Future<ThemeMode> fetchThemeMode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final index = sharedPreferences.getInt(_themeModeKey);
    return ThemeMode.values[index ?? ThemeMode.light.index];
  }

  /* static const _languageKey = 'LANGUAGE'; */
}
