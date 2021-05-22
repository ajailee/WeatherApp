import 'dart:convert';

import '/models/locationModel.dart';
import 'package:http/http.dart' as http;
import '/models/forecastModel.dart';

import './weatherApi.dart';

class OpenWeatherMapWeatherApi extends WeatherApi {
  static const endPointUrl = 'https://api.openweathermap.org/data/2.5';
  static const apiKey = 'f23a68b9f1df3c866893262eba802098';
  http.Client httpclient;
  OpenWeatherMapWeatherApi() {
    this.httpclient = new http.Client();
  }
  @override
  Future<LocationModel> getLocation(String city) async {
    final requestUrl = '$endPointUrl/weather?q=$city&APPID=$apiKey';

    print(requestUrl);
    final response = await this.httpclient.get(Uri.parse(requestUrl));
    if (response.statusCode == 200) {
      return LocationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Unable to get the location for the city :${response.statusCode}');
    }
  }

  @override
  Future<ForecaseModel> getWeather(LocationModel location, String city) async {
    final requestUrl =
        '$endPointUrl/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&APPID=$apiKey';
    print(requestUrl);
    final response = await this.httpclient.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      final res = ForecaseModel.fromJson(jsonDecode(response.body), city);

      return res;
    } else {
      throw Exception(
          'Unable to get the weather for the Given Location :${response.statusCode}');
    }
  }
}
