import 'package:flutter/material.dart';

import '../../domain/entities/weather.dart';
import 'weather_visuals.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final textColor = WeatherVisuals.textColorFor(weather.weatherState);

    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(WeatherVisuals.imageFor(weather.weatherState)),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.cityName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: textColor,
            ),
          ),
          Text(
            '${weather.temperature}°',
            style: TextStyle(
              fontFamily: 'Mukta',
              fontSize: 35,
              color: textColor,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Column(
                children: [
                  Text(
                    weather.weatherState,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    weather.weatherStateDescription,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    'min ${weather.minTemperature}°',
                    style: TextStyle(
                      fontFamily: 'Mukta',
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                  Text(
                    'max ${weather.maxTemperature}°',
                    style: TextStyle(
                      fontFamily: 'Mukta',
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
