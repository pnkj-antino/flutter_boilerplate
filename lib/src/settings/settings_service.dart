import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/core/utils/shared_prefs.dart';

/// Keys for settings in SharedPreferences
class SettingsKeys {
  static const String themeMode = 'theme_mode';
}

/// A service that stores and retrieves user settings.
///
/// This class persists user settings locally using shared_preferences package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local storage.
  Future<ThemeMode> themeMode() async {
    // Make sure SharedPrefs is initialized
    await SharedPrefs.init();
    
    // Get the stored theme mode index, default to system (0)
    final themeModeIndex = SharedPrefs.getInt(SettingsKeys.themeMode) ?? 0;
    
    // Convert the index to a ThemeMode
    return ThemeMode.values[themeModeIndex];
  }

  /// Persists the user's preferred ThemeMode to local storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Make sure SharedPrefs is initialized
    await SharedPrefs.init();
    
    // Store the theme mode as an integer (index in the enum)
    await SharedPrefs.setInt(SettingsKeys.themeMode, theme.index);
  }
}
