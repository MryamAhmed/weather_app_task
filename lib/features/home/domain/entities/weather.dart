import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required String cityName,
    required String weatherState,
    required String weatherStateDescription,
    required num temperature,
    required num minTemperature,
    required num maxTemperature,
  }) = _Weather;
}
