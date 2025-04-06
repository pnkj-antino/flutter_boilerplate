# Flutter Boilerplate Documentation

## Table of Contents

1. [Project Overview](#project-overview)
2. [Project Structure](#project-structure)
3. [Architecture](#architecture)
4. [Core Components](#core-components)
5. [State Management](#state-management)
6. [Navigation](#navigation)
7. [API Integration](#api-integration)
8. [Local Storage](#local-storage)
9. [Environment Configuration](#environment-configuration)
10. [Analytics and Monitoring](#analytics-and-monitoring)
11. [Error Handling](#error-handling)
12. [Testing](#testing)
13. [Localization](#localization)
14. [Theming](#theming)
15. [Best Practices](#best-practices)

## Project Overview

This Flutter Boilerplate is a highly structured template for building production-ready Flutter applications. It incorporates modern architecture patterns, state management solutions, error handling, analytics, and many other features commonly needed in real-world applications.

### Key Features

- **Clean Architecture**: Separation of concerns with layers for presentation, domain, and data
- **State Management**: BLoC/Cubit with proper state handling
- **Navigation**: go_router for declarative routing and deep linking
- **API Integration**: Dio client with interceptors for HTTP requests
- **Local Storage**: Hive and SharedPreferences for data persistence
- **Environment Configuration**: Multiple environment setup with dotenv
- **Analytics and Monitoring**: Firebase Analytics and Crashlytics integration
- **Error Handling**: Comprehensive error handling with Sentry
- **Dependency Injection**: Service locator pattern with get_it
- **Internationalization**: Built-in localization support
- **Theming**: Dynamic theming with dark/light mode support

## Project Structure

The project follows a feature-first structure with clear separation of concerns:

```
lib/
├── main.dart                  # Entry point
├── src/
│   ├── app.dart              # App configuration with MaterialApp
│   ├── core/                 # Core functionality
│   │   ├── analytics/        # Analytics services
│   │   ├── api/              # API client and services
│   │   ├── database/         # Local database services
│   │   ├── di/               # Dependency injection
│   │   ├── env/              # Environment configuration
│   │   ├── error/            # Error handling and reporting
│   │   ├── models/           # Shared data models
│   │   ├── navigation/       # Router and navigation
│   │   └── utils/            # Utility classes and functions
│   ├── features/             # Feature modules
│   │   ├── auth/             # Authentication feature
│   │   │   ├── data/         # Repositories and data sources
│   │   │   └── presentation/ # UI components and state management
│   │   └── home/             # Home screen feature
│   ├── localization/         # Localization files
│   └── settings/             # App settings
```

## Architecture

The project follows a clean architecture pattern with clear separation of concerns:

1. **Presentation Layer**: UI components, screens, and state management (BLoC/Cubit)
2. **Domain Layer**: Business logic, use cases, and domain models
3. **Data Layer**: Repositories, data sources, and DTOs

### Dependency Flow

```
UI/Widgets → Cubits/BLoCs → Repositories → Data Sources (API/Local)
```

## Core Components

### Dependency Injection

The project uses the `get_it` package for service location and dependency injection. Services are registered in the `lib/src/core/di/service_locator.dart` file.

```dart
// Register a singleton
getIt.registerSingleton<ApiService>(ApiService(dio));

// Register a lazy singleton
getIt.registerLazySingleton<AuthRepository>(
  () => AuthRepository(
    apiService: getIt<ApiService>(),
    connectivityService: getIt<ConnectivityService>(),
    databaseService: getIt<DatabaseService>(),
  ),
);

// Get an instance
final apiService = getIt<ApiService>();
```

### Error Handling

The project includes a comprehensive error handling system:

1. **AppException**: Base class for all application exceptions
2. **Result<T>**: Generic class for handling success/failure cases
3. **CrashReportingService**: Service for reporting errors to Firebase Crashlytics and Sentry
4. **ErrorBoundaryWidget**: Widget for catching and displaying errors in UI

```dart
// Using Result for error handling
Future<Result<User>> getUser(String id) async {
  try {
    final user = await _apiService.getUser(id);
    return Result.success(user);
  } on DioException catch (e) {
    return Result.failure(AppException.fromDioException(e));
  } catch (e) {
    return Result.failure(AppException.unexpected(message: e.toString()));
  }
}

// Using Result in the UI
result.when(
  success: (data) => UserInfoWidget(user: data),
  failure: (error) => ErrorWidget(error: error),
);
```

## State Management

The project uses BLoC/Cubit pattern for state management:

### Cubit

```dart
// State class
class AuthState extends Equatable {
  final bool isLoading;
  final User? user;
  final AppException? error;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  bool get isAuthenticated => user != null && !isLoading && error == null;

  AuthState copyWith({
    bool? isLoading,
    User? user,
    AppException? error,
    bool clearUser = false,
    bool clearError = false,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: clearUser ? null : (user ?? this.user),
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props => [isLoading, user, error];
}

// Cubit class
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  
  AuthCubit({required AuthRepository authRepository}) 
      : _authRepository = authRepository,
        super(AuthState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true, clearError: true));
    
    final result = await _authRepository.login(email: email, password: password);
    
    result.when(
      success: (authResponse) {
        emit(state.copyWith(isLoading: false, user: authResponse.user));
      },
      failure: (exception) {
        emit(state.copyWith(isLoading: false, error: exception));
      },
    );
  }
}
```

### Usage in UI

```dart
BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if (state.isAuthenticated) {
      context.go('/home');
    }
    
    if (state.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error!.userFriendlyMessage)),
      );
    }
  },
  builder: (context, state) {
    return state.isLoading
        ? const CircularProgressIndicator()
        : LoginForm(
            onSubmit: (email, password) => context.read<AuthCubit>().login(
              email: email,
              password: password,
            ),
          );
  },
)
```

## Navigation

The project uses the `go_router` package for declarative routing:

```dart
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'settings',
          name: 'settings',
          builder: (context, state) => SettingsView(
            controller: settingsController,
          ),
        ),
        GoRoute(
          path: 'details/:id',
          name: 'details',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return DetailScreen(id: id);
          },
        ),
      ],
    ),
  ],
);
```

### Navigation Usage

```dart
// Navigate to a route
context.go('/settings');

// Navigate with parameters
context.go('/details/123');

// Navigate with named route
context.goNamed('details', pathParameters: {'id': '123'});

// Pop to previous route
context.pop();
```

## API Integration

The project uses the `dio` package for HTTP requests:

### DioClient

```dart
final dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ),
);

dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) {
      // Add auth token
      if (_authToken != null) {
        options.headers['Authorization'] = 'Bearer $_authToken';
      }
      return handler.next(options);
    },
    onError: (DioException e, handler) {
      // Handle token refresh
      if (e.response?.statusCode == 401) {
        // Refresh token logic
      }
      return handler.next(e);
    },
  ),
);
```

### ApiService

```dart
Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
  try {
    final response = await _dio.get(endpoint, queryParameters: queryParameters);
    return response.data;
  } on DioException catch (e) {
    throw AppException.fromDioException(e);
  } catch (e) {
    throw AppException.unexpected(message: e.toString());
  }
}
```

### Repository

```dart
Future<Result<List<User>>> getUsers() async {
  return safeApiCall(
    apiCall: () async {
      final response = await _apiService.get('/users');
      return (response as List)
          .map((item) => User.fromJson(item))
          .toList();
    },
    errorMessage: 'Failed to get users',
  );
}
```

## Local Storage

The project uses multiple storage solutions:

### Hive for Object Storage

```dart
@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final String email;
  
  User({required this.id, required this.name, required this.email});
}

// Register the adapter
Hive.registerAdapter(UserAdapter());

// Open box
final box = await Hive.openBox<User>('users');

// Save data
box.put('user_1', user);

// Get data
final user = box.get('user_1');
```

### SharedPreferences for Simple Data

```dart
// Save data
await SharedPrefs.setString('token', 'my_token');

// Get data
final token = SharedPrefs.getString('token');
```

## Environment Configuration

The project supports multiple environments (development, staging, production) using the `flutter_dotenv` package:

### .env Files

```
# .env.dev
ENVIRONMENT=dev
API_BASE_URL=https://dev-api.example.com
API_KEY=dev_api_key
ANALYTICS_ENABLED=false
```

```
# .env.prod
ENVIRONMENT=prod
API_BASE_URL=https://api.example.com
API_KEY=prod_api_key
ANALYTICS_ENABLED=true
```

### Usage

```dart
final apiBaseUrl = EnvConfig().apiBaseUrl;
final apiKey = EnvConfig().apiKey;
final isProduction = EnvConfig().isProduction;
```

## Analytics and Monitoring

The project includes services for analytics tracking and error monitoring:

### Analytics

```dart
// Track screen view
analyticsService.trackScreenView('HomeScreen');

// Track user action
analyticsService.trackButtonClick('login_button');

// Track custom event
analyticsService.trackCustomEvent('feature_used', parameters: {
  'feature_name': 'image_upload',
  'file_size': fileSize,
});
```

### Error Monitoring

```dart
// Log non-fatal error
crashReportingService.logError(
  error,
  stackTrace,
  reason: 'Failed to load data',
  information: {'userId': '123', 'action': 'getData'},
);

// Set user info
crashReportingService.setUserIdentifier(
  userId,
  email: userEmail,
  name: userName,
);
```

## Testing

The project includes examples for different types of tests:

### Unit Testing

```dart
group('AuthRepository', () {
  late AuthRepository repository;
  late MockApiService mockApiService;
  
  setUp(() {
    mockApiService = MockApiService();
    repository = AuthRepository(apiService: mockApiService);
  });
  
  test('login should return user when successful', () async {
    // Arrange
    when(mockApiService.post(any, data: anyNamed('data')))
        .thenAnswer((_) async => {'token': 'test', 'user': {'id': '1', 'name': 'Test'}});
    
    // Act
    final result = await repository.login(email: 'test@test.com', password: '123456');
    
    // Assert
    expect(result.isSuccess, true);
    expect(result.data.user.id, '1');
  });
});
```

### Widget Testing

```dart
testWidgets('LoginScreen shows error when login fails', (WidgetTester tester) async {
  // Arrange
  final mockAuthCubit = MockAuthCubit();
  when(mockAuthCubit.state).thenReturn(AuthState(error: AppException.server(message: 'Invalid credentials')));
  
  // Act
  await tester.pumpWidget(
    BlocProvider<AuthCubit>.value(
      value: mockAuthCubit,
      child: const MaterialApp(home: LoginScreen()),
    ),
  );
  
  // Assert
  expect(find.text('Invalid credentials'), findsOneWidget);
});
```

## Localization

The project supports internationalization using Flutter's built-in localization system:

### Localization Files

```json
// app_en.arb
{
  "helloWorld": "Hello World!",
  "helloUser": "Hello {userName}",
  "@helloUser": {
    "placeholders": {
      "userName": {
        "type": "String",
        "example": "Alice"
      }
    }
  }
}
```

### Usage

```dart
// Get the current locale's translations
final l10n = AppLocalizations.of(context)!;

// Use a translated string
Text(l10n.helloWorld);

// Use a translated string with parameters
Text(l10n.helloUser(userName));
```

## Theming

The project includes a theming system with light and dark mode support:

### Theme Configuration

```dart
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.blue,
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.blue,
  brightness: Brightness.dark,
);
```

### Theme Usage

```dart
// Use the current theme's colors
final primaryColor = Theme.of(context).colorScheme.primary;

// Use the current theme's text styles
final headlineStyle = Theme.of(context).textTheme.headlineMedium;
```

## Best Practices

1. **Use the Repository Pattern**: Always access data through repositories, not directly from API services or databases.
2. **Handle Errors Properly**: Use the Result class for error handling and display user-friendly error messages.
3. **Separate Business Logic**: Keep business logic separate from UI code using Cubits or BLoCs.
4. **Use Dependency Injection**: Register services in the service locator and inject dependencies.
5. **Write Tests**: Write unit tests for repositories and business logic, and widget tests for UI components.
6. **Follow the Style Guide**: Adhere to effective Dart style guide for consistent code formatting.
7. **Document Your Code**: Add documentation comments to classes and methods.
8. **Use Constants**: Define and use constants for strings, dimensions, and other values.
9. **Optimize Performance**: Use lazy loading, caching, and other performance optimization techniques.
10. **Consider Accessibility**: Make your app accessible to all users by using semantic labels, sufficient contrast, and proper focus navigation.