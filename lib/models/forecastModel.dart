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
    this.lastupdated,
    this.longitude,
    this.latitude,
    this.daily: const [],
    this.current,
    this.isDayTime,
    this.city,
  });

  static ForecaseModel fromJson(dynamic json) {
    try {
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
          feelLikeTemp: json['current']['feelLikeTemp'],
          pressure: json['current']['pressure'],
          humidity: json['current']['humidity'],
          uvi: json['current']['uvi'],
          windSpeed: json['current']['wind_speed'],
          cloudiness: json['current']['clouds'],
          date: date);

      return ForecaseModel(
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
