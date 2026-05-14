import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  const WeatherRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        AppConstants.currentWeatherPath,
        queryParameters: {'q': cityName},
      );

      final data = response.data;
      if (data == null) {
        throw const ServerException('Empty weather response');
      }

      return WeatherModel.fromJson(data);
    } on DioException catch (error) {
      throw ServerException(error.message ?? 'Failed to fetch weather');
    }
  }
}
