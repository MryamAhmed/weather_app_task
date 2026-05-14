import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class SaveCity implements UseCase<Unit, String> {
  const SaveCity(this._repository);

  final HomeRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(String params) {
    return _repository.saveCity(params);
  }
}
