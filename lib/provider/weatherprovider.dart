import 'package:flutter/material.dart';
import '/api/openweatherMapApi.dart';
import '/models/forecastModel.dart';
import '../models/locationModel.dart';

class WeatherProvider extends ChangeNotifier {
  OpenWeatherMapWeatherApi weatherApi = new OpenWeatherMapWeatherApi();
  Future<ForecaseModel> currentWeather() async {
    LocationModel loc = await weatherApi.getLocation('London');
    ForecaseModel fore = await weatherApi.getWeather(loc);

    return fore;
  }
}
