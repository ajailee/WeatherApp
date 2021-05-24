import 'package:flutter/foundation.dart';

import 'weatherModel.dart';

class ForecaseModel {
  final DateTime lastupdated;
  final double longitude;
  final double latitude;
  final List<WeatherModel> daily;
  final WeatherModel current;
  final bool isDayTime;
  final String city;

  ForecaseModel({
    @required this.lastupdated,
    @required this.longitude,
    @required this.latitude,
    this.daily: const [],
    @required this.current,
    @required this.isDayTime,
    @required this.city,
  });

  static ForecaseModel fromJson(dynamic json, String city) {
    try {
      print(json['timezone']);
      var weather = json['current']['weather'][0];

      var date = DateTime.fromMicrosecondsSinceEpoch(
          json['current']['dt'] * 1000,
          isUtc: true);

      var sunrise = DateTime.fromMicrosecondsSinceEpoch(
          json['current']['sunrise'] * 1000,
          isUtc: true);

      var sunset = DateTime.fromMicrosecondsSinceEpoch(
          json['current']['sunset'] * 1000,
          isUtc: true);

      bool isDay = date.isAfter(sunrise) && date.isBefore(sunset);

      bool hasDaily = json['daily'] != null;

      var tempDaily = [];

      if (hasDaily) {
        List items = json['daily'];
        tempDaily = items
            .map((e) => WeatherModel.fromDailyJson(e))
            .toList()
            .skip(1)
            .take(7)
            .toList();
      }

      var currentForecast = WeatherModel(
        condition: WeatherModel.mapStringToWeatherCondition(
            weather['main'], int.parse(json['current']['clouds'].toString())),
        description: weather['description'],
        temp: json['current']['temp'],
        feelLikeTemp: json['current']['feels_like'],
        pressure: json['current']['pressure'],
        humidity: json['current']['humidity'].toInt() ?? 0.0,
        uvi: json['current']['uvi'].toDouble() ?? 0.0,
        windSpeed: json['current']['wind_speed'].toDouble() ?? 0.0,
        cloudiness: json['current']['clouds'].toInt() ?? 0,
        dewpoint: json['current']['dew_point'].toDouble() ?? 0.0,
        visibility: json['current']['visibility'].toInt() ?? 0,
        winddeg: json['current']['wind_deg'].toInt() ?? 0,
        windgust: json['current']['wind_gust'] != null
            ? json['current']['wind_gust'].toDouble()
            : 0.0,
        date: date,
      );

      return ForecaseModel(
        city: city,
        lastupdated: DateTime.now(),
        current: currentForecast,
        latitude: json['lat'].toDouble(),
        longitude: json['lon'].toDouble(),
        daily: tempDaily,
        isDayTime: isDay,
      );
    } catch (e) {
      throw e;
    }
  }
}
