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
      backgroundColor: Colors.black,
      body: BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context, state) {
          if(state is WeatherSuccessState){
            return SafeArea
              (
                child: HomeViewBody(
                    model: state.weatherModel
                )
            );
          }
          else if(state is WeatherFailureState){
            return   Center(
                child: faieldBody(errorMessage: state.error,)
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


class faieldBody extends StatelessWidget {
  const faieldBody({
    super.key,
    required this.errorMessage
  });

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorMessage,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}