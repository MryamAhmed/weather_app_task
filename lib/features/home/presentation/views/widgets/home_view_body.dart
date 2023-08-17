import 'package:flutter/material.dart';
import 'package:weather/features/home/data/models/weather_model.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key,required this.model}) : super(key: key);

  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/id/237/200/300"),
            fit: BoxFit.cover
        ),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
            const SizedBox(
              height: 5,
            ),
            Text(
              model.weatherState,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              model.degree.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
          ],
        ),
      ),
    );
  }
}
