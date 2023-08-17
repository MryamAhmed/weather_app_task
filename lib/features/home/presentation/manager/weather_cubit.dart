import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/weather_model.dart';
import '../../data/repos/home_repo.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.homeRepo) : super(WeatherInitial());

  final HomeRepo homeRepo ;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName})async{
    emit(WeatherLoadingState());

    var result =await  homeRepo.fetchCurrentWeather(
        url: 'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=096e1aea2ab31151168f21eb88822bb4'
    );

    result.fold((l) => {
      emit(WeatherFailureState(error: l.errMessage))
    }, (r) => {
      emit(WeatherSuccessState(weatherModel: r))
    });
  }
}
