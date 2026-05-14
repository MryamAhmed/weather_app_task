// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      name: json['name'] as String,
      main: MainWeatherModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) =>
              WeatherDescriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'main': instance.main,
      'weather': instance.weather,
    };

_$MainWeatherModelImpl _$$MainWeatherModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MainWeatherModelImpl(
      temp: json['temp'] as num,
      tempMin: json['temp_min'] as num,
      tempMax: json['temp_max'] as num,
    );

Map<String, dynamic> _$$MainWeatherModelImplToJson(
        _$MainWeatherModelImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
    };

_$WeatherDescriptionModelImpl _$$WeatherDescriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherDescriptionModelImpl(
      main: json['main'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$WeatherDescriptionModelImplToJson(
        _$WeatherDescriptionModelImpl instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
    };
