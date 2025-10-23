import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/src/core/env/env_config.dart';

/// Types of analytics events
enum AnalyticsEventType {
  /// Screen view event
  screenView,

  /// Button click event
  buttonClick,

  /// User login event
  login,

  /// User registration event
  registration,

  /// App startup event
  appStart,

  /// Error event
  error,

  /// Feature usage event
  featureUsage,

  /// Search event
  search,

  /// Content view event
  contentView,

  /// Custom event
  custom,
}

/// Service to track analytics events
class AnalyticsService {
  final FirebaseAnalytics _analytics;
  final EnvConfig _envConfig;

  /// Whether analytics tracking is enabled
  bool get isEnabled => _envConfig.analyticsEnabled && !kDebugMode;

  /// Constructor
  AnalyticsService({
    required FirebaseAnalytics analytics,
    required EnvConfig envConfig,
  }) : _analytics = analytics,
       _envConfig = envConfig;

  /// Track a screen view
  Future<void> trackScreenView(String screenName) async {
    if (!isEnabled) return;

    try {
      await _analytics.logScreenView(screenName: screenName);

      if (kDebugMode) {
        print('Analytics - Screen View: $screenName');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Analytics error: $e');
      }
    }
  }

  /// Track a button click
  Future<void> trackButtonClick(
    String buttonName, {
    Map<String, dynamic>? parameters,
  }) async {
    if (!isEnabled) return;

    try {
      await _analytics.logEvent(
        name: 'button_click',
        parameters: {'button_name': buttonName, ...?parameters},
      );

      if (kDebugMode) {
        print('Analytics - Button Click: $buttonName');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Analytics error: $e');
      }
    }
  }

  /// Track a login event
  Future<void> trackLogin(String method) async {
    if (!isEnabled) return;

    try {
      await _analytics.logLogin(loginMethod: method);

      if (kDebugMode) {
        print('Analytics - Login: $method');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Analytics error: $e');
      }
    }
  }

  /// Track a sign up event
  Future<void> trackSignUp(String method) async {
    if (!isEnabled) return;

    try {
      await _analytics.logSignUp(signUpMethod: method);

      if (kDebugMode) {
        print('Analytics - Sign Up: $method');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Analytics error: $e');
      }
    }
  }

  /// Track a search event
  Future<void> trackSearch(String searchTerm) async {
    if (!isEnabled) return;

    try {
      await _analytics.logSearch(searchTerm: searchTerm);

      if (kDebugMode) {
        print('Analytics - Search: $searchTerm');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Analytics error: $e');
      }
    }
  }

  /// Track an error event
  Future<void> trackError(String errorType, String errorMessage) async {
    if (!isEnabled) return;

    try {
      await _analytics.logEvent(
        name: 'error',
        parameters: {'error_type': errorType, 'error_message': errorMessage},
      );

      if (kDebugMode) {
        print('Analytics - Error: $errorType - $errorMessage');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Analytics error: $e');
      }
    }
  }

  /// Track a feature usage event
  Future<void> trackFeatureUsage(
    String featureName, {
    Map<String, dynamic>? parameters,
  }) async {
    if (!isEnabled) return;

    try {
      await _analytics.logEvent(
        name: 'feature_usage',
        parameters: {'feature_name': featureName, ...?parameters},
      );

      if (kDebugMode) {
        print('Analytics - Feature Usage: $featureName');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Analytics error: $e');
      }
    }
  }

  /// Track a custom event
  Future<void> trackCustomEvent(
    String eventName, {
    Map<String, Object>? parameters,
  }) async {
    if (!isEnabled) return;

    try {
      await _analytics.logEvent(name: eventName, parameters: parameters);

      if (kDebugMode) {
        print('Analytics - Custom Event: $eventName');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Analytics error: $e');
      }
    }
  }

  /// Set user properties
  Future<void> setUserProperties({
    String? userId,
    String? userRole,
    Map<String, dynamic>? customProperties,
  }) async {
    if (!isEnabled) return;

    try {
      if (userId != null) {
        await _analytics.setUserId(id: userId);
      }

      if (userRole != null) {
        await _analytics.setUserProperty(name: 'user_role', value: userRole);
      }

      if (customProperties != null) {
        for (final entry in customProperties.entries) {
          await _analytics.setUserProperty(
            name: entry.key,
            value: entry.value.toString(),
          );
        }
      }

      if (kDebugMode) {
        print('Analytics - User Properties set');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Analytics error: $e');
      }
    }
  }
}
