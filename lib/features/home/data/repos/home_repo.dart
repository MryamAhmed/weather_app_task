import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../models/weather_model.dart';


abstract class HomeRepo{
  Future<Either<Failure,WeatherModel>>fetchCurrentWeather({required String? cityName});
}

