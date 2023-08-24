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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.cityName,
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color:model.getColor(),
            ),),
          Text(
            '${model.maxDegree}°',
            style:  TextStyle(
              fontFamily: 'Mukta',
              fontSize: 35,
              color:model.getColor(),
            ),
          ),
          const SizedBox(
            height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Column(
                children: [
                  Text(
                    model.weatherState,
                    style:  TextStyle(
                      color: model.getColor(),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    model.weatherStateDesc,
                    style:  TextStyle(
                      color: model.getColor(),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text('min ${model.maxDegree}°',
                    style:  TextStyle(
                      fontFamily: 'Mukta',
                      fontSize: 20,
                      color: model.getColor(),
                    ),
                  ),
                  Text('max ${model.minDegree}°',
                    style:  TextStyle(
                      fontFamily: 'Mukta',
                      fontSize: 20,
                      color: model.getColor(),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}

