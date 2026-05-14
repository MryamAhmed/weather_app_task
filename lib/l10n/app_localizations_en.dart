import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'WEATHER APP';

  @override
  String get searchTitle => 'Search';

  @override
  String get emptyWeatherMessage => 'There is no weather. Start search.';

  @override
  String get enterCityName => 'Enter City Name...';

  @override
  String get searchAgain => 'Search again';

  @override
  String minTemperature(num temperature) {
    return 'min $temperature°';
  }

  @override
  String maxTemperature(num temperature) {
    return 'max $temperature°';
  }
}
