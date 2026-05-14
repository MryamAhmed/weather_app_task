import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/weather_local_data_source.dart';
import '../data_sources/weather_remote_data_source.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  final WeatherRemoteDataSource _remoteDataSource;
  final WeatherLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try {
      final hasConnection = await _networkInfo.isConnected;
      if (!hasConnection) {
        return left(const Failure.network());
      }

      final model = await _remoteDataSource.getCurrentWeather(cityName);
      return right(model.toEntity());
    } on ServerException catch (error) {
      return left(Failure.server(error.message));
    } catch (error) {
      return left(Failure.unknown(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> getCachedCity() async {
    try {
      return right(await _localDataSource.getCachedCity());
    } on CacheException catch (error) {
      return left(Failure.cache(error.message));
    } catch (error) {
      return left(Failure.unknown(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveCity(String cityName) async {
    try {
      await _localDataSource.saveCity(cityName);
      return right(unit);
    } on CacheException catch (error) {
      return left(Failure.cache(error.message));
    } catch (error) {
      return left(Failure.unknown(error.toString()));
    }
  }
}
