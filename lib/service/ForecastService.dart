import 'package:flutter/foundation.dart';
import '../models/forecastModel.dart';
import '../models/locationModel.dart';

class ForecastService {
  final weatherApi;
  ForecastService({@required this.weatherApi});

  Future<ForecaseModel> getWeather(String city) async {
    final LocationModel location = await this.weatherApi.getLocation(city);
    final ForecaseModel res = await this.weatherApi.getWeather(location);
  }
}
