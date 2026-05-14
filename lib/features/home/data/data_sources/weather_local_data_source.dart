import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/exceptions.dart';

abstract class WeatherLocalDataSource {
  Future<String?> getCachedCity();
  Future<void> saveCity(String cityName);
}

@LazySingleton(as: WeatherLocalDataSource)
class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  const WeatherLocalDataSourceImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<String?> getCachedCity() async {
    return _preferences.getString(AppConstants.cachedCityKey);
  }

  @override
  Future<void> saveCity(String cityName) async {
    final saved = await _preferences.setString(
      AppConstants.cachedCityKey,
      cityName,
    );

    if (!saved) {
      throw const CacheException('Failed to save city');
    }
  }
}
