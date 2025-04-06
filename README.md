# Flutter Boilerplate

A modern Flutter application boilerplate with a well-structured architecture and best practices.

## Features

- **Navigation**: [go_router](https://pub.dev/packages/go_router) for declarative routing
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) and [equatable](https://pub.dev/packages/equatable)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it) service locator
- **API Client**: [dio](https://pub.dev/packages/dio) for HTTP requests with interceptors
- **Data Class Generation**: [freezed](https://pub.dev/packages/freezed) and [json_serializable](https://pub.dev/packages/json_serializable)
- **Local Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences) 
- **Connectivity**: [connectivity_plus](https://pub.dev/packages/connectivity_plus) for network status
- **Logging**: [logger](https://pub.dev/packages/logger) for better debugging
- **Internationalization**: Built-in localization support
- **Theming**: Light and dark theme with Material 3 design

## Project Structure

```
lib/
├── main.dart                  # Entry point
├── src/
│   ├── app.dart              # App configuration with MaterialApp
│   ├── core/                 # Core functionality
│   │   ├── api/              # API client and services
│   │   ├── di/               # Dependency injection
│   │   ├── models/           # Data models (freezed)
│   │   ├── navigation/       # Router and navigation
│   │   └── utils/            # Utility classes and functions
│   ├── features/             # Feature modules
│   │   └── home/             # Home screen feature
│   ├── localization/         # Localization files
│   └── settings/             # App settings
```

## Getting Started

### Prerequisites

- Flutter SDK: 3.5.4 or higher
- Dart SDK: 3.0.0 or higher

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/flutter_boilerplate.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the build_runner to generate code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app
```bash
flutter run
```

## Internationalization

This project supports multiple languages using Flutter's built-in localization system. Localized strings are defined in ARB files in the `lib/src/localization` directory.

To add a new language:
1. Create a new ARB file in the `lib/src/localization` directory (e.g., `app_es.arb` for Spanish)
2. Run `flutter gen-l10n` to generate the localization code

## Theming

The app includes both light and dark themes with Material 3 design. The theme can be switched in the settings page.

## Testing

The project includes example tests:

```bash
# Run all tests
flutter test

# Run a specific test
flutter test test/widget_test.dart
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.