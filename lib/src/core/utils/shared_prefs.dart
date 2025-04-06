import 'package:shared_preferences/shared_preferences.dart';

/// Utility class for handling shared preferences storage
class SharedPrefs {
  static SharedPreferences? _prefs;
  
  /// Initialize SharedPreferences
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Get SharedPreferences instance
  static SharedPreferences get instance {
    if (_prefs == null) {
      throw Exception('SharedPreferences not initialized. Call init() first.');
    }
    return _prefs!;
  }
  
  /// Clear all preferences
  static Future<bool> clear() async {
    return await instance.clear();
  }
  
  /// Store a string value
  static Future<bool> setString(String key, String value) async {
    return await instance.setString(key, value);
  }
  
  /// Get a string value
  static String? getString(String key) {
    return instance.getString(key);
  }
  
  /// Store a boolean value
  static Future<bool> setBool(String key, bool value) async {
    return await instance.setBool(key, value);
  }
  
  /// Get a boolean value
  static bool? getBool(String key) {
    return instance.getBool(key);
  }
  
  /// Store an integer value
  static Future<bool> setInt(String key, int value) async {
    return await instance.setInt(key, value);
  }
  
  /// Get an integer value
  static int? getInt(String key) {
    return instance.getInt(key);
  }
  
  /// Store a double value
  static Future<bool> setDouble(String key, double value) async {
    return await instance.setDouble(key, value);
  }
  
  /// Get a double value
  static double? getDouble(String key) {
    return instance.getDouble(key);
  }
  
  /// Store a string list
  static Future<bool> setStringList(String key, List<String> value) async {
    return await instance.setStringList(key, value);
  }
  
  /// Get a string list
  static List<String>? getStringList(String key) {
    return instance.getStringList(key);
  }
  
  /// Remove a key
  static Future<bool> remove(String key) async {
    return await instance.remove(key);
  }
  
  /// Check if key exists
  static bool containsKey(String key) {
    return instance.containsKey(key);
  }
}