import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

/// Service for handling local database operations
class DatabaseService {
  static const String _settingsBoxName = 'settings';
  static const String _cacheBoxName = 'cache';
  static const String _userBoxName = 'user';
  
  late Box<dynamic> _settingsBox;
  late Box<dynamic> _cacheBox;
  late Box<dynamic> _userBox;
  
  /// Initialize the database
  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    
    _settingsBox = await Hive.openBox<dynamic>(_settingsBoxName);
    _cacheBox = await Hive.openBox<dynamic>(_cacheBoxName);
    _userBox = await Hive.openBox<dynamic>(_userBoxName);
    
    if (kDebugMode) {
      print('Hive initialized at ${appDocumentDir.path}');
    }
  }
  
  /// Close all boxes
  Future<void> close() async {
    await _settingsBox.close();
    await _cacheBox.close();
    await _userBox.close();
  }
  
  /// Clear all data
  Future<void> clearAll() async {
    await _settingsBox.clear();
    await _cacheBox.clear();
    await _userBox.clear();
  }
  
  // Settings box methods
  
  /// Get a value from settings box
  T? getSetting<T>(String key, {T? defaultValue}) {
    return _settingsBox.get(key, defaultValue: defaultValue) as T?;
  }
  
  /// Save a value to settings box
  Future<void> saveSetting<T>(String key, T value) async {
    await _settingsBox.put(key, value);
  }
  
  /// Remove a value from settings box
  Future<void> removeSetting(String key) async {
    await _settingsBox.delete(key);
  }
  
  // Cache box methods
  
  /// Cache an object with expiration
  Future<void> cacheObject({
    required String key,
    required Map<String, dynamic> data,
    required Duration expiration,
  }) async {
    final expiryTime = DateTime.now().add(expiration).millisecondsSinceEpoch;
    
    final cacheData = {
      'data': data,
      'expiry': expiryTime,
    };
    
    await _cacheBox.put(key, jsonEncode(cacheData));
  }
  
  /// Get a cached object
  Map<String, dynamic>? getCachedObject(String key) {
    final cachedValue = _cacheBox.get(key);
    
    if (cachedValue == null) {
      return null;
    }
    
    try {
      final cacheData = jsonDecode(cachedValue as String) as Map<String, dynamic>;
      final expiryTime = cacheData['expiry'] as int;
      
      // Check if cache is expired
      if (DateTime.now().millisecondsSinceEpoch > expiryTime) {
        // Cache expired, remove it
        _cacheBox.delete(key);
        return null;
      }
      
      return cacheData['data'] as Map<String, dynamic>;
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing cached object: $e');
      }
      return null;
    }
  }
  
  /// Remove a cached object
  Future<void> removeCachedObject(String key) async {
    await _cacheBox.delete(key);
  }
  
  /// Clear all cached objects
  Future<void> clearCache() async {
    await _cacheBox.clear();
  }
  
  // User box methods
  
  /// Save user data
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    await _userBox.put('current_user', jsonEncode(userData));
  }
  
  /// Get user data
  Map<String, dynamic>? getUserData() {
    final userData = _userBox.get('current_user');
    
    if (userData == null) {
      return null;
    }
    
    try {
      return jsonDecode(userData as String) as Map<String, dynamic>;
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing user data: $e');
      }
      return null;
    }
  }
  
  /// Clear user data
  Future<void> clearUserData() async {
    await _userBox.clear();
  }
}