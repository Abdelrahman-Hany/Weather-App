import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
 const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            // onChanged: (value) {
            //   log(value);
            // },
            onSubmitted: (value) async {
              // weatherModel =
              //await WeatherService().getCurrentWeather(cityName: value);
              // log(weatherModel.cityName);

              //trigger cubit
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);//this is object of GetWeatherCubit
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context); //return the main page on submitte
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 16,
              ),
              labelText: 'Search',
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.orange,
                ), //used to give border color
              ),
              /*//border will take all areas
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:const BorderSide(color: Colors.green
                ),
                ),
                focusedBorder: OutlineInputBorder(),
                */
            ),
          ),
        ),
      ),
    );
  }
}
