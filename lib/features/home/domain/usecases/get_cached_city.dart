import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetCachedCity implements UseCase<String?, NoParams> {
  const GetCachedCity(this._repository);

  final HomeRepository _repository;

  @override
  Future<Either<Failure, String?>> call(NoParams params) {
    return _repository.getCachedCity();
  }
}
