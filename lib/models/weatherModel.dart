import 'package:flutter/material.dart';

enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  mist,
  fog,
  lightCloud,
  heavyCloud,
  clear,
  smoke,
  haze,
  dust,
  sand,
  ash,
  squall,
  tornado,
  unknown
}

class WeatherModel {
  final WeatherCondition condition;
  final String description;
  final double temp;
  final double feelLikeTemp;
  final int pressure;
  final int humidity;
  final double uvi;
  final double windSpeed;
  final int cloudiness;
  final DateTime date;

  WeatherModel({
    @required this.condition,
    @required this.description,
    @required this.temp,
    @required this.feelLikeTemp,
    @required this.pressure,
    @required this.humidity,
    @required this.uvi,
    @required this.windSpeed,
    @required this.cloudiness,
    @required this.date,
  });

  static WeatherModel fromDailyJson(dynamic daily) {
    var cloudiness = daily['clouds'];
    var weather = daily['weather'][0];

    return WeatherModel(
      condition: mapStringToWeatherCondition(weather['main'], cloudiness),
      description: weather['description'],
      temp: daily['temp']['day'].toDouble(),
      feelLikeTemp: daily['temp']['day'].toDouble(),
      pressure: daily['pressure'].toInt(),
      humidity: daily['humidity'].toInt(),
      uvi: daily['uvi'].toDouble(),
      windSpeed: daily['wind_speed'].toDouble(),
      cloudiness: cloudiness,
      date:
          DateTime.fromMillisecondsSinceEpoch(daily['dt'] * 1000, isUtc: true),
    );
  }

  static WeatherCondition mapStringToWeatherCondition(
      String input, int cloudiness) {
    WeatherCondition condition;
    switch (input) {
      case 'Thunderstorm':
        condition = WeatherCondition.thunderstorm;
        break;
      case 'Drizzle':
        condition = WeatherCondition.drizzle;
        break;
      case 'Rain':
        condition = WeatherCondition.rain;
        break;
      case 'Snow':
        condition = WeatherCondition.snow;
        break;
      case 'Clear':
        condition = WeatherCondition.clear;
        break;
      case 'Clouds':
        condition = (cloudiness >= 85)
            ? WeatherCondition.heavyCloud
            : WeatherCondition.lightCloud;
        break;
      case 'Mist':
        condition = WeatherCondition.mist;
        break;
      case 'fog':
        condition = WeatherCondition.fog;
        break;
      case 'Smoke':
        condition = WeatherCondition.smoke;
        break;
      case 'Haze':
        condition = WeatherCondition.haze;
        break;
      case 'Dust':
        condition = WeatherCondition.dust;
        break;
      case 'Sand':
        condition = WeatherCondition.sand;
        break;
      case 'Ash':
        condition = WeatherCondition.ash;
        break;
      case 'Squall':
        condition = WeatherCondition.squall;
        break;
      case 'Tornado':
        condition = WeatherCondition.tornado;
        break;
      default:
        condition = WeatherCondition.unknown;
    }

    return condition;
  }
}
