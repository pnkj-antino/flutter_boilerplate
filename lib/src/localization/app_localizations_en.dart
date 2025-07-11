// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Boilerplate';

  @override
  String get helloWorld => 'Hello World!';

  @override
  String helloUser(String userName) {
    return 'Hello $userName';
  }

  @override
  String remainingEmails(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emails left',
      one: '1 email left',
      zero: 'No emails left',
    );
    return '$_temp0';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get themeSettingsTitle => 'Theme Settings';

  @override
  String get systemTheme => 'System Theme';

  @override
  String get lightTheme => 'Light Theme';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get detailsTitle => 'Details';

  @override
  String get itemDetails => 'Item Details';

  @override
  String get goBack => 'Go Back';

  @override
  String get notFound => 'Not Found';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get goHome => 'Go Home';
}
