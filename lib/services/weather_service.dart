import'dart:developer';

import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final dio = Dio();

  final String baseURL =
      'https://api.weatherapi.com/v1'; //it is butter to put the first part of the domain in variable to quickly modify it in case the chang occure in the domain name
  final String apiKey =
      'f074d07be6b642b29c0132447230110'; //in case apiKey changed

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMassage = e.response?.data['error']['message'] ??
          'oops there was an error try later'; // the ? make the respons.data occures when the response value is not null but if the value is null it can't put in this place so i put ?? which is an condition occures when the value is null return this text
      throw Exception(errorMassage);
    } catch (e) {
      //in cas there is an exception that is not dio exception
      log(e.toString());
      throw Exception('opps there was an error try later');
    }

    // if (response.statusCode == 200) {
    //   WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    //   return weatherModel;
    // } else {
    //   final String errorMassage = response.data['error']['message'];
    //   throw Exception(errorMassage);
    // }

  }
}
