import 'package:flutter/material.dart';
import 'package:today/models/forecastModel.dart';
import 'package:today/service/ForecastService.dart';
import '/provider/weatherprovider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  ForecastService service;

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherProvider>(context);
    return FutureBuilder(
        future: weather.currentWeather(),
        builder: (context, AsyncSnapshot<ForecaseModel> snapshot) {
          return Container();
        });
  }
}
