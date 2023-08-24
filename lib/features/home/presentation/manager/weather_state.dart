part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}
class WeatherSuccessState extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccessState({required this.weatherModel});
}
class WeatherFailureState extends WeatherState {
  String error;

  WeatherFailureState({required this.error});
}


class WeatherNullState extends WeatherState {
  String Message;

  WeatherNullState({required this.Message});
}