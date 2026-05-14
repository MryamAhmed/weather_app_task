// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/network/network_info.dart' as _i75;
import 'core/routes/app_router.dart' as _i251;
import 'core/utils/simple_bloc_observer.dart' as _i313;
import 'features/home/data/data_sources/weather_local_data_source.dart'
    as _i174;
import 'features/home/data/data_sources/weather_remote_data_source.dart'
    as _i444;
import 'features/home/data/repositories/home_repository_impl.dart' as _i689;
import 'features/home/domain/repositories/home_repository.dart' as _i649;
import 'features/home/domain/usecases/get_cached_city.dart' as _i248;
import 'features/home/domain/usecases/get_current_weather.dart' as _i969;
import 'features/home/domain/usecases/save_city.dart' as _i15;
import 'features/home/presentation/manager/home_cubit.dart' as _i683;
import 'features/search/domain/usecases/search_city_weather.dart' as _i665;
import 'features/search/presentation/manager/search_cubit.dart' as _i908;
import 'injection_container.dart' as _i809;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  final networkModule = _$NetworkModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i161.InternetConnection>(
      () => networkModule.internetConnection);
  gh.lazySingleton<_i251.AppRouter>(() => _i251.AppRouter());
  gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i313.SimpleBlocObserver>(() => registerModule.blocObserver);
  gh.lazySingleton<_i75.NetworkInfo>(
      () => _i75.NetworkInfoImpl(gh<_i161.InternetConnection>()));
  gh.lazySingleton<_i444.WeatherRemoteDataSource>(
      () => _i444.WeatherRemoteDataSourceImpl(gh<_i361.Dio>()));
  gh.lazySingleton<_i174.WeatherLocalDataSource>(
      () => _i174.WeatherLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i649.HomeRepository>(() => _i689.HomeRepositoryImpl(
        gh<_i444.WeatherRemoteDataSource>(),
        gh<_i174.WeatherLocalDataSource>(),
        gh<_i75.NetworkInfo>(),
      ));
  gh.lazySingleton<_i248.GetCachedCity>(
      () => _i248.GetCachedCity(gh<_i649.HomeRepository>()));
  gh.lazySingleton<_i969.GetCurrentWeather>(
      () => _i969.GetCurrentWeather(gh<_i649.HomeRepository>()));
  gh.lazySingleton<_i15.SaveCity>(
      () => _i15.SaveCity(gh<_i649.HomeRepository>()));
  gh.lazySingleton<_i665.SearchCityWeather>(
      () => _i665.SearchCityWeather(gh<_i15.SaveCity>()));
  gh.factory<_i683.HomeCubit>(() => _i683.HomeCubit(
        gh<_i969.GetCurrentWeather>(),
        gh<_i248.GetCachedCity>(),
      ));
  gh.factory<_i908.SearchCubit>(
      () => _i908.SearchCubit(gh<_i665.SearchCityWeather>()));
  return getIt;
}

class _$RegisterModule extends _i809.RegisterModule {}

class _$NetworkModule extends _i75.NetworkModule {}
