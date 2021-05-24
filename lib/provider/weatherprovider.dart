import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:today/service/locationService.dart';
import '/api/openweatherMapApi.dart';
import '/models/forecastModel.dart';
import '../models/locationModel.dart';

class WeatherProvider extends ChangeNotifier {
  OpenWeatherMapWeatherApi weatherApi = new OpenWeatherMapWeatherApi();
  ForecaseModel fore;
  Future<ForecaseModel> currentWeather() async {
    if (fore != null) {
      return fore;
    }
    MyLocation location = new MyLocation();
    var curr = await location.getlocFur();
    print(curr.latitude);
    print(curr.longitude);
    LocationModel loc =
        new LocationModel(latitude: curr.latitude, longitude: curr.longitude);
    // final Coordinates coordinates =
    //     new Coordinates(curr.latitude, curr.longitude);
    // var address =
    //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
    GeoCode geoCode = GeoCode();
    var address = await geoCode.reverseGeocoding(
        latitude: curr.latitude, longitude: curr.longitude);

    print(address.city);
    var city = address.city ?? address.countryName;
    fore = await weatherApi.getWeather(loc, city);
    return fore;
  }

  Future<void> changeweather(LocationModel locationModel) async {
    GeoCode geoCode = GeoCode();
    var address = await geoCode.reverseGeocoding(
        latitude: locationModel.latitude, longitude: locationModel.longitude);

    print(address.city);
    var city = address.region ?? address.countryName;
    fore = await weatherApi.getWeather(locationModel, city);
    notifyListeners();
  }
}
