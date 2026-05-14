import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/weather.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetCurrentWeather implements UseCase<Weather, String> {
  const GetCurrentWeather(this._repository);

  final HomeRepository _repository;

  @override
  Future<Either<Failure, Weather>> call(String params) {
    return _repository.getCurrentWeather(params);
  }
}
