import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/weather_model.dart';
import '../../data/repos/home_repo.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.homeRepo) : super(WeatherInitial());

  final HomeRepo homeRepo ;
  WeatherModel? weatherModel;

  void getWeather({required String cityName})async{
    emit(WeatherLoadingState());

    var result =await  homeRepo.fetchCurrentWeather(cityName: cityName);
    result.fold((l) => {
      emit(WeatherFailureState(error: l.errMessage)),
      print(l.errMessage)
    }, (r) => {
      emit(WeatherSuccessState(weatherModel: r))
    });
  }

}
