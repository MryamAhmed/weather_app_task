import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:weather/core/error/failure.dart';

import 'package:weather/features/home/data/models/weather_model.dart';

import '../../../../core/utils/api.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, WeatherModel>> fetchCurrentWeather({required String? cityName}) async{
    try{
      Map<dynamic, dynamic> data = await apiService.get(
          url: 'https://api.openweathermap.org/data/2.5/weather?q=$cityName,lat=44.34&lon=10.99&units=metric&appid=096e1aea2ab31151168f21eb88822bb4');

      WeatherModel weather = WeatherModel.fromJson(data);

      return right(weather);

    } catch(e){

      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
