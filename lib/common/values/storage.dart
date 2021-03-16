import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static final StorageUtil _instance = StorageUtil._();
  factory StorageUtil() => _instance;
  static SharedPreferences _prefs;

  StorageUtil._();

  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  /// 设置json 对象
  Future<bool> setJson(String key, dynamic jsonValue) {
    String jsonString = jsonEncode(jsonValue);
    return _prefs.setString(key, jsonString);
  }

  /// 获取json 对象
  dynamic getJson(String key) {
    String jsonString = _prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }
}
