import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_boilerplate/src/core/analytics/analytics_service.dart';
import 'package:flutter_boilerplate/src/core/api/api_config.dart';
import 'package:flutter_boilerplate/src/core/api/dio_client.dart';
import 'package:flutter_boilerplate/src/core/api/api_service.dart';
import 'package:flutter_boilerplate/src/core/database/database_service.dart';
import 'package:flutter_boilerplate/src/core/env/env_config.dart';
import 'package:flutter_boilerplate/src/core/error/crash_reporting_service.dart';
import 'package:flutter_boilerplate/src/core/navigation/app_router.dart';
import 'package:flutter_boilerplate/src/core/utils/connectivity_service.dart';
import 'package:flutter_boilerplate/src/core/utils/shared_prefs.dart';
import 'package:flutter_boilerplate/src/features/auth/data/auth_repository.dart';
import 'package:flutter_boilerplate/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_boilerplate/src/settings/settings_controller.dart';
import 'package:flutter_boilerplate/src/settings/settings_service.dart';

/// Global ServiceLocator instance
final GetIt getIt = GetIt.instance;

/// Initialize all services and dependencies
Future<void> setupServiceLocator() async {
  // Initialize environment configuration
  await EnvConfig.initialize();
  final envConfig = EnvConfig();
  getIt.registerSingleton<EnvConfig>(envConfig);
  
  // Initialize SharedPreferences
  await SharedPrefs.init();
  
  // Database
  final databaseService = DatabaseService();
  await databaseService.init();
  getIt.registerSingleton<DatabaseService>(databaseService);
  
  // Analytics and Crash Reporting
  final firebaseAnalytics = FirebaseAnalytics.instance;
  getIt.registerSingleton<FirebaseAnalytics>(firebaseAnalytics);
  
  getIt.registerSingleton<AnalyticsService>(
    AnalyticsService(
      analytics: firebaseAnalytics,
      envConfig: envConfig,
    ),
  );
  
  final firebaseCrashlytics = FirebaseCrashlytics.instance;
  getIt.registerSingleton<FirebaseCrashlytics>(firebaseCrashlytics);
  
  final crashReportingService = CrashReportingService(
    crashlytics: firebaseCrashlytics,
    envConfig: envConfig,
  );
  await crashReportingService.initialize();
  getIt.registerSingleton<CrashReportingService>(crashReportingService);
  
  // Utils
  getIt.registerLazySingleton<ConnectivityService>(
    () => ConnectivityService(),
  );
  
  // API and Network
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(baseUrl: ApiConfig.baseUrl),
  );
  
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt<DioClient>()),
  );
  
  // Settings
  getIt.registerLazySingleton<SettingsService>(
    () => SettingsService(),
  );
  
  getIt.registerLazySingleton<SettingsController>(
    () => SettingsController(getIt<SettingsService>()),
  );
  
  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      apiService: getIt<ApiService>(),
      connectivityService: getIt<ConnectivityService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  
  // Cubits/BLoCs
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(authRepository: getIt<AuthRepository>()),
  );
  
  // Router
  getIt.registerLazySingleton<AppRouter>(
    () => AppRouter(
      settingsController: getIt<SettingsController>(),
      authCubit: getIt<AuthCubit>(),
    ),
  );
  
  // Initialize cubits
  await getIt<AuthCubit>().initialize();
  
  // Load settings at app start
  await getIt<SettingsController>().loadSettings();
}