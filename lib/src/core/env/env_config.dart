import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Environment types available in the app
enum Environment {
  /// Development environment
  dev,

  /// Staging environment
  staging,

  /// Production environment
  prod,
}

/// Configuration for different environments
class EnvConfig {
  static final EnvConfig _instance = EnvConfig._internal();

  /// Environment type
  late Environment env;

  /// API base URL
  late String apiBaseUrl;

  /// API key
  late String apiKey;

  /// Whether to enable analytics
  late bool analyticsEnabled;

  /// Whether to enable crash reporting
  late bool crashReportingEnabled;

  /// App version
  late String appVersion;

  /// App build number
  late String buildNumber;

  /// Whether the app is in debug mode
  late bool isDebug;

  /// Package name or bundle ID
  late String packageName;

  /// Cache timeout in minutes
  late int cacheTimeoutMinutes;

  /// Sentry DSN for error reporting
  late String sentryDsn;

  /// Sentry traces sample rate
  late double sentryTracesSampleRate;

  /// Factory constructor to return the singleton instance
  factory EnvConfig() {
    return _instance;
  }

  EnvConfig._internal();

  /// Initialize environment configuration
  static Future<void> initialize() async {
    // Load environment variables from .env file
    await dotenv.load(fileName: '.env');

    // Get package info
    final packageInfo = await PackageInfo.fromPlatform();

    // Set environment type
    final envName = dotenv.get('ENVIRONMENT', fallback: 'dev');
    final env = _parseEnvironment(envName);

    // Set base URL based on environment
    final apiBaseUrl = _getApiBaseUrl(env);

    // Configure the instance
    _instance.env = env;
    _instance.apiBaseUrl = apiBaseUrl;
    _instance.apiKey = dotenv.get('API_KEY', fallback: '');
    _instance.analyticsEnabled =
        _parseBoolean(dotenv.get('ANALYTICS_ENABLED', fallback: 'false'));
    _instance.crashReportingEnabled =
        _parseBoolean(dotenv.get('CRASH_REPORTING_ENABLED', fallback: 'false'));
    _instance.appVersion = packageInfo.version;
    _instance.buildNumber = packageInfo.buildNumber;
    _instance.isDebug = kDebugMode;
    _instance.packageName = packageInfo.packageName;
    _instance.cacheTimeoutMinutes =
        int.tryParse(dotenv.get('CACHE_TIMEOUT_MINUTES', fallback: '60')) ?? 60;
    _instance.sentryDsn = dotenv.get('SENTRY_DSN', fallback: '');
    _instance.sentryTracesSampleRate =
        double.tryParse(dotenv.get('SENTRY_TRACES_SAMPLE_RATE', fallback: '0.1')) ?? 0.1;

    if (kDebugMode) {
      print('Environment: ${_instance.env}');
      print('API URL: ${_instance.apiBaseUrl}');
      print('App Version: ${_instance.appVersion} (${_instance.buildNumber})');
    }
  }

  /// Parse environment type from string
  static Environment _parseEnvironment(String value) {
    switch (value.toLowerCase()) {
      case 'prod':
      case 'production':
        return Environment.prod;
      case 'staging':
      case 'stage':
        return Environment.staging;
      case 'dev':
      case 'development':
      default:
        return Environment.dev;
    }
  }

  /// Get API base URL based on environment
  static String _getApiBaseUrl(Environment env) {
    // First try to get from .env file
    final envUrl = dotenv.get('API_BASE_URL', fallback: '');
    if (envUrl.isNotEmpty) {
      return envUrl;
    }

    // If not set in .env, use default values based on environment
    switch (env) {
      case Environment.prod:
        return 'https://api.example.com';
      case Environment.staging:
        return 'https://staging-api.example.com';
      case Environment.dev:
        return 'https://dev-api.example.com';
    }
  }

  /// Parse boolean from string
  static bool _parseBoolean(String value) {
    return value.toLowerCase() == 'true';
  }

  /// Check if running in production
  bool get isProduction => env == Environment.prod;

  /// Check if running in staging
  bool get isStaging => env == Environment.staging;

  /// Check if running in development
  bool get isDevelopment => env == Environment.dev;

  /// Get full API URL with version
  String get apiUrl => '$apiBaseUrl/v1';
}
