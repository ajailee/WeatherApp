import '/models/forecastModel.dart';
import '/models/locationModel.dart';

abstract class WeatherApi {
  Future<ForecaseModel> getWeather(LocationModel location, String city);
  Future<LocationModel> getLocation(String city);
}
