import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'src/app.dart';
import 'src/core/di/service_locator.dart';
import 'src/core/error/crash_reporting_service.dart';
import 'src/features/auth/presentation/cubit/auth_cubit.dart';

void main() async {
  // Catch all errors in the application
  await runZonedWithSentry(() async {
    // Ensure Flutter binding is initialized
    WidgetsFlutterBinding.ensureInitialized();
    
    // Set preferred orientations
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    
    // Initialize Firebase
    await Firebase.initializeApp();
    
    // Initialize Hive
    await Hive.initFlutter();
    
    // Initialize service locator
    await setupServiceLocator();
  });
}

/// Run the app with Sentry error tracking
Future<void> runZonedWithSentry(Future<void> Function() appRunner) async {
  try {
    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://examplePublicKey@o0.ingest.sentry.io/0';
        options.tracesSampleRate = 1.0;
        options.enableAutoSessionTracking = true;
      },
      // Run app initialization in app runner
      appRunner: appRunner,
    );
    
    // Run the app and pass in the SettingsController from service locator.
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>.value(value: getIt<AuthCubit>()),
        ],
        child: MyApp(
          settingsController: getIt(),
        ),
      ),
    );
  } catch (error, stackTrace) {
    // Log any error during initialization
    debugPrint('Error during initialization: $error');
    if (getIt.isRegistered<CrashReportingService>()) {
      await getIt<CrashReportingService>().logError(
        error,
        stackTrace,
        reason: 'Error during app initialization',
      );
    }
    // Still try to run the app if possible
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Failed to initialize the app: $error'),
          ),
        ),
      ),
    );
  }
}