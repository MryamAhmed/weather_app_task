import 'package:flutter/material.dart';
import 'package:weather/features/home/data/models/weather_model.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key,required this.model}) : super(key: key);

  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,

      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(model.getImage()),
            fit: BoxFit.cover
        ),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Colors.white,
            ),),
            const SizedBox(
              height: 8,
            ),
            Text(
              model.weatherState,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              model.degree.toString(),
              style: const TextStyle(
                fontFamily: 'Mukta',
                fontSize: 50,
                color: Colors.white,
              ),),
          ],
        ),
      ),
    );
  }
}
