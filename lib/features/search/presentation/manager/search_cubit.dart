import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/search_city_weather.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchCityWeather) : super(const SearchState.initial());

  final SearchCityWeather _searchCityWeather;

  Future<void> search(String cityName) async {
    final normalizedCity = cityName.trim();
    if (normalizedCity.isEmpty) {
      emit(const SearchState.failure('Please enter a city name'));
      return;
    }

    emit(const SearchState.loading());
    final result = await _searchCityWeather(normalizedCity);

    result.fold(
      (failure) => emit(SearchState.failure(_failureMessage(failure))),
      (_) => emit(const SearchState.success()),
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
