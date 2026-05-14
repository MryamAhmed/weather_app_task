import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/weather.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const WeatherModel._();

  const factory WeatherModel({
    required String name,
    required MainWeatherModel main,
    required List<WeatherDescriptionModel> weather,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Weather toEntity() {
    final description = weather.isNotEmpty
        ? weather.first
        : const WeatherDescriptionModel(main: 'Clear', description: 'clear sky');

    return Weather(
      cityName: name,
      weatherState: description.main,
      weatherStateDescription: description.description,
      temperature: main.temp,
      minTemperature: main.tempMin,
      maxTemperature: main.tempMax,
    );
  }
}

@freezed
class MainWeatherModel with _$MainWeatherModel {
  const factory MainWeatherModel({
    required num temp,
    @JsonKey(name: 'temp_min') required num tempMin,
    @JsonKey(name: 'temp_max') required num tempMax,
  }) = _MainWeatherModel;

  factory MainWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherModelFromJson(json);
}

@freezed
class WeatherDescriptionModel with _$WeatherDescriptionModel {
  const factory WeatherDescriptionModel({
    required String main,
    required String description,
  }) = _WeatherDescriptionModel;

  factory WeatherDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionModelFromJson(json);
}
