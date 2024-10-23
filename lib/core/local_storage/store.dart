import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Store {
  SharedPreferences? _prefs;

  Future<void> _initialize() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  void save(String key, Map<String, Object> json) async {
    await _initialize();
    _prefs?.setString(key, jsonEncode(json));
  }

  Future <Map<String, Object>>? getObject(String key) async {
   await _initialize();

    final json = _prefs?.getString(key);

    if (json != null) {
      return jsonDecode(json);
    }
    throw Exception("Not found");
  }

  void clear() async {
    await _prefs?.clear();
    _prefs = null;
  }
}
