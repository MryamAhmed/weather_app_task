import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_cached_city.dart';
import '../../domain/usecases/get_current_weather.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getCurrentWeather,
    this._getCachedCity,
  ) : super(const HomeState.initial());

  final GetCurrentWeather _getCurrentWeather;
  final GetCachedCity _getCachedCity;

  Future<void> loadInitial() async {
    emit(const HomeState.loading());

    final result = await _getCachedCity(const NoParams());
    await result.fold(
      (failure) async => emit(HomeState.failure(_failureMessage(failure))),
      (cityName) async {
        if (cityName == null || cityName.trim().isEmpty) {
          emit(const HomeState.empty());
          return;
        }

        await getWeather(cityName: cityName);
      },
    );
  }

  Future<void> getWeather({required String cityName}) async {
    emit(const HomeState.loading());

    final result = await _getCurrentWeather(cityName);
    result.fold(
      (failure) => emit(HomeState.failure(_failureMessage(failure))),
      (weather) => emit(HomeState.success(weather)),
    );
  }

  String _failureMessage(Failure failure) {
    return failure.when(
      server: (message) => message,
      cache: (message) => message,
      network: (message) => message,
      unknown: (message) => message,
    );
  }
}
