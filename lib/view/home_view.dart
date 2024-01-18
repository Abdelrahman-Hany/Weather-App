import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/view/search_view.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const SearchView(),
                ),
              );
            },
            icon:const Icon(Icons.search),
          ),
        ],
      ),
      
      //integerate cubit
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        //we must spcifay to the blockBuilder which cubit to use and spcify which state he use
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeather();
          } else if (state is WeatherLoadedState) {
            return  const WeatherInfo();
          } else {
            return const Text('oops there was an error');
          }
        },
      ),
    );
  }
}
