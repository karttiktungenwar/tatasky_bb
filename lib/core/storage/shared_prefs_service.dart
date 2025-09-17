import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  final SharedPreferences _prefs;
  SharedPrefsService(this._prefs);

  String? getString(String key) => _prefs.getString(key);
  Future<bool> setString(String key ,String value) => _prefs.setString(key, value);

  bool? getBool(String key) => _prefs.getBool(key);
  Future<bool> setBool(String key ,bool value) => _prefs.setBool(key, value);
}