import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/home/presentation/views/home_view.dart';
import '../../../../../const.dart';
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
        decoration:  InputDecoration(
          suffixIcon: IconButton(
            onPressed: (){
              BlocProvider.of<WeatherCubit>(context).saveCity('city',city_name);
            Navigator.pop(context);
              String? cityFromCash = BlocProvider.of<WeatherCubit>(context).getCity('city');
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityFromCash);
            }, icon: const Icon(
            Icons.search_outlined,
            color: mainColor,
          ),),
          hintText: "Enter City Name...",
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: mainColor,
              )
          ),
        ),
          onChanged: (data){
            city_name= data;
          },
        ),
      ),
    );
  }
}
