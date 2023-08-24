import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/core/cash_helper.dart';
import '../../data/models/weather_model.dart';
import '../../data/repos/home_repo.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.homeRepo) : super(WeatherInitial());

  final HomeRepo homeRepo ;
  WeatherModel? weatherModel;

  void getWeather({required String? cityName})async{
    emit(WeatherLoadingState());
    if(getCity('city')== 'null'){
      emit(WeatherNullState(Message: 'null'));
    }else{
      var result =await  homeRepo.fetchCurrentWeather(cityName: cityName);
      result.fold((l) => {
        emit(WeatherFailureState(error: l.errMessage)),
      }, (r) => {
        emit(WeatherSuccessState(weatherModel: r)),
      });
    }


  }

  void saveCity( String key ,String? city) {
    CasheHelper.setCity(key, city);
  }

  String getCity(  String key) {
    String? cityName = CasheHelper.getCity(key);
    return cityName;
  }



}
