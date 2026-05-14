import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تطبيق الطقس';

  @override
  String get searchTitle => 'بحث';

  @override
  String get emptyWeatherMessage => 'لا توجد بيانات طقس. ابدأ البحث.';

  @override
  String get enterCityName => 'أدخل اسم المدينة...';

  @override
  String get searchAgain => 'ابحث مرة أخرى';

  @override
  String minTemperature(num temperature) {
    return 'الصغرى $temperature°';
  }

  @override
  String maxTemperature(num temperature) {
    return 'الكبرى $temperature°';
  }
}
