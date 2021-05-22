import '/models/forecastModel.dart';
import '/models/locationModel.dart';

abstract class WeatherApi {
  Future<ForecaseModel> getWeather(LocationModel location);
  Future<LocationModel> getLocation(String city);
}
