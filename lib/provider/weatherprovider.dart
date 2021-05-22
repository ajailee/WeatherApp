import 'package:flutter/material.dart';
import '/api/openweatherMapApi.dart';
import '/models/forecastModel.dart';
import '../models/locationModel.dart';

class WeatherProvider extends ChangeNotifier {
  OpenWeatherMapWeatherApi weatherApi = new OpenWeatherMapWeatherApi();
  ForecaseModel fore;
  Future<ForecaseModel> currentWeather(String city) async {
    LocationModel loc = await weatherApi.getLocation(city);
    fore = await weatherApi.getWeather(loc, city);
    return fore;
  }
}
