import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/home/presentation/views/widgets/home_view_body.dart';
import '../manager/weather_cubit.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context, state) {
          if(state is WeatherSuccessState){
            return SafeArea
              (child: HomeViewBody(model: state.weatherModel)
            );
          }
          else if(state is WeatherFailureState){
            return  Center(
              child: Text('${state.error}'),
            );
          }
          else{
            return  const Center(
                child: CircularProgressIndicator());
          }
        }
      )
    );
  }
}
