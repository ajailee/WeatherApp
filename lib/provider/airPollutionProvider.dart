import 'package:flutter/material.dart';
import 'package:today/api/airPollutionApi.dart';
import 'package:today/models/airPollution.dart';
import 'package:today/service/locationService.dart';

class AirPollutionProvider extends ChangeNotifier {
  AirPollutionApi api = new AirPollutionApi();
  Future<AirPollutionModel> getAirPollution() async {
    MyLocation location = new MyLocation();
    var curr = await location.getlocFur();
    var let = await api.getAirPollution(
        lat: curr.latitude.toString(), long: curr.latitude.toString());
    print(let.date);
    return let;
  }
}
