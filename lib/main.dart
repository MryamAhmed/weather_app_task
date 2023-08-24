import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/cash_helper.dart';
import 'package:weather/features/home/presentation/views/home_view.dart';
import 'package:weather/simple_bloc_observer.dart';
import 'core/utils/api.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/manager/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  Bloc.observer=SimpleBlocObserver();
  await CasheHelper.init();
  runApp( BlocProvider(
      create: (context){
        return WeatherCubit(HomeRepoImpl(ApiService(Dio())));
      },
   child: const WeatherApp()
      )
  );
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeView(),
    );
  }
}
