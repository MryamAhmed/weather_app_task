import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/weather.dart';

abstract class HomeRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
  Future<Either<Failure, String?>> getCachedCity();
  Future<Either<Failure, Unit>> saveCity(String cityName);
}
