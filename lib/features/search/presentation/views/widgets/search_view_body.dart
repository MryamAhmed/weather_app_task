import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/home/presentation/views/home_view.dart';

import '../../../../home/presentation/manager/weather_cubit.dart';

class SearchViewBody extends StatelessWidget {
   SearchViewBody({Key? key}) : super(key: key);

  String? city_name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: TextField(
        decoration: const InputDecoration(
          hintText: "Enter City Name...",
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purple,
              )
          ),
        ),
          onChanged: (data){
            city_name= data;
          },
          onSubmitted: (data) async{
            city_name= data;
            BlocProvider.of<WeatherCubit>(context).getWeather(cityName: city_name!);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          },
        ),
      ),
    );
  }
}
