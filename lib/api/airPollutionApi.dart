import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:today/models/airPollution.dart';

class AirPollutionApi {
  http.Client httpclient;
  AirPollutionApi() {
    this.httpclient = new http.Client();
  }

  Future<AirPollutionModel> getAirPollution({String lat, String long}) async {
    final requestUrl =
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$long&appid=f23a68b9f1df3c866893262eba802098';

    final response = await this.httpclient.get(Uri.parse(requestUrl));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return AirPollutionModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Unable to get the air pollution for the city :${response.statusCode}');
    }
  }
}
