import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'core/utils/api.dart';
import 'features/home/data/repos/home_repo.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/manager/weather_cubit.dart';
import 'features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( BlocProvider(
      create: (context){
        return WeatherCubit(HomeRepoImpl(ApiService(Dio())));
      },
   child: WeatherApp()
      )
  );
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeView(),
    );
  }
}
