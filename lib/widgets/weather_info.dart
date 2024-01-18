import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';


class WeatherInfo extends StatelessWidget {
  const WeatherInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    
      Gradient getGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter, 
      colors: [
        getThemeColor(weatherModel.weatherCondition).withOpacity(1.0), // Opaque version of the base color
        getThemeColor(weatherModel.weatherCondition).withOpacity(0.0), // Transparent version of the base color
      ],
    );
  }
    
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: getGradient(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weatherModel.image}',
                  fit: BoxFit.cover,
                ),
                Text(
                  '${weatherModel.temp}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Column(
                  children: [
                    Text('Maxtemp: ${weatherModel.maxTemp.round()}'),
                    Text('Mintemp: ${weatherModel.minTemp.round()}'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
          ],
        ),
      ),
    );
  }
}

