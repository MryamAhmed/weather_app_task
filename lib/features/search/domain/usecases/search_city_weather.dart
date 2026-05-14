import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../home/domain/usecases/save_city.dart';

@lazySingleton
class SearchCityWeather implements UseCase<Unit, String> {
  const SearchCityWeather(this._saveCity);

  final SaveCity _saveCity;

  @override
  Future<Either<Failure, Unit>> call(String params) {
    return _saveCity(params);
  }
}
