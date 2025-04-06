import 'dart:async';
import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/src/core/env/env_config.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Service for crash reporting and error monitoring
class CrashReportingService {
  final FirebaseCrashlytics _crashlytics;
  final EnvConfig _envConfig;
  final bool _useSentry;

  /// Whether crash reporting is enabled
  bool get isEnabled => _envConfig.crashReportingEnabled && !kDebugMode;

  /// Constructor
  CrashReportingService({
    required FirebaseCrashlytics crashlytics,
    required EnvConfig envConfig,
    bool useSentry = true,
  })  : _crashlytics = crashlytics,
        _envConfig = envConfig,
        _useSentry = useSentry;

  /// Initialize crash reporting service
  Future<void> initialize() async {
    if (!isEnabled) {
      // Disable crash reporting in debug mode
      await _crashlytics.setCrashlyticsCollectionEnabled(false);
      return;
    }

    // Enable crash reporting
    await _crashlytics.setCrashlyticsCollectionEnabled(true);

    // Pass all uncaught errors to Crashlytics
    FlutterError.onError = (FlutterErrorDetails details) {
      _crashlytics.recordFlutterFatalError(details);
      // Also forward to console in debug mode
      if (kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      }
    };

    // Handle errors from the current Isolate
    PlatformDispatcher.instance.onError = (error, stack) {
      _crashlytics.recordError(error, stack, fatal: true);
      return true;
    };

    // Handle errors from Isolates
    Isolate.current.addErrorListener(RawReceivePort((pair) {
      final List<dynamic> errorAndStacktrace = pair;
      final error = errorAndStacktrace[0];
      final stackTrace = StackTrace.fromString(errorAndStacktrace[1]);
      _crashlytics.recordError(error, stackTrace, fatal: true);
    }).sendPort);
  }

  /// Set user information for crash reports
  Future<void> setUserIdentifier(String userId,
      {String? email, String? name}) async {
    if (!isEnabled) return;

    await _crashlytics.setUserIdentifier(userId);

    if (email != null) {
      await Sentry.configureScope((scope) {
        scope.setUser(SentryUser(id: userId, email: email, username: name));
      });
    }
  }

  /// Log a non-fatal error
  Future<void> logError(
    dynamic exception,
    StackTrace stackTrace, {
    String? reason,
    Map<String, dynamic>? information,
  }) async {
    if (!isEnabled) {
      if (kDebugMode) {
        print('Error: $exception');
        print('StackTrace: $stackTrace');
        if (reason != null) print('Reason: $reason');
        if (information != null) print('Information: $information');
      }
      return;
    }

    // Add custom keys for the crash report
    if (information != null) {
      for (final entry in information.entries) {
        await _crashlytics.setCustomKey(entry.key, entry.value.toString());
      }
    }

    // Log custom error message if provided
    if (reason != null) {
      await _crashlytics.log(reason);
    }

    // Record the error
    await _crashlytics.recordError(
      exception,
      stackTrace,
      reason: reason,
      fatal: false,
    );

    // Also send to Sentry if enabled
    if (_useSentry) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  /// Log a message to crash reporting service
  Future<void> log(String message) async {
    if (!isEnabled) {
      if (kDebugMode) {
        print('Log: $message');
      }
      return;
    }

    await _crashlytics.log(message);
  }

  /// Record a fatal crash
  Future<void> recordFatalCrash(dynamic exception, StackTrace stackTrace,
      {String? reason}) async {
    if (!isEnabled) {
      if (kDebugMode) {
        print('Fatal Error: $exception');
        print('StackTrace: $stackTrace');
        if (reason != null) print('Reason: $reason');
      }
      return;
    }

    // Log custom error message if provided
    if (reason != null) {
      await _crashlytics.log(reason);
    }

    // Record the error as fatal
    await _crashlytics.recordError(
      exception,
      stackTrace,
      reason: reason,
      fatal: true,
    );

    // Also send to Sentry if enabled
    if (_useSentry) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
        hint: Hint.withMap({'reason': reason}),
      );
    }
  }
}
