import 'package:flutter/material.dart';

class AirPollutionModel {
  final double lon;
  final double lat;
  final int aqi;
  final double co;
  final double no;
  final double no2;
  final double o3;
  final double so2;
  final double pm2_5;
  final double pm10;
  final double nh3;
  final DateTime date;

  AirPollutionModel({
    @required this.lon,
    @required this.lat,
    @required this.aqi,
    @required this.co,
    @required this.no,
    @required this.no2,
    @required this.o3,
    @required this.so2,
    @required this.pm2_5,
    @required this.pm10,
    @required this.nh3,
    @required this.date,
  });
  static AirPollutionModel fromJson(dynamic json) {
    //print(json['list'][0]['components']['co']);
    return AirPollutionModel(
        lon: json['coord']['lon'].toDouble(),
        lat: json['coord']['lat'].toDouble(),
        aqi: json['list'][0]['main']['aqi'],
        co: json['list'][0]['components']['co'].toDouble(),
        no: json['list'][0]['components']['no'].toDouble(),
        no2: json['list'][0]['components']['no2'].toDouble(),
        o3: json['list'][0]['components']['o3'].toDouble(),
        so2: json['list'][0]['components']['so2'].toDouble(),
        pm2_5: json['list'][0]['components']['pm2_5'].toDouble(),
        pm10: json['list'][0]['components']['pm10'].toDouble(),
        nh3: json['list'][0]['components']['nh3'].toDouble(),
        date: DateTime.fromMicrosecondsSinceEpoch(json['list'][0]['dt'] * 1000,
            isUtc: true));
  }
}
