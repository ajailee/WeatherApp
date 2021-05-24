import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:today/models/weatherModel.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TempIcon extends StatelessWidget {
  final WeatherCondition condition;

  const TempIcon({Key key, @required this.condition}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String _image = 'assets/images/day.svg';
    if (condition == WeatherCondition.thunderstorm) {
      _image = 'assets/images/thunder.svg';
    } else if (condition == WeatherCondition.drizzle) {
      _image = 'assets/images/rainy-5.svg';
    } else if (condition == WeatherCondition.rain) {
      _image = 'assets/images/rainy-5.svg';
    } else if (condition == WeatherCondition.snow) {
      _image = 'assets/images/snowy-6.svg';
    } else if (condition == WeatherCondition.mist) {
      _image = 'assets/images/snowy-4.svg';
    } else if (condition == WeatherCondition.fog) {
      _image = 'assets/images/snowy-5.svg';
    } else if (condition == WeatherCondition.lightCloud) {
      _image = 'assets/images/cloudy-day-3.svg';
    } else if (condition == WeatherCondition.heavyCloud) {
      _image = 'assets/images/cloudy.svg';
    } else if (condition == WeatherCondition.clear) {
      _image = 'assets/images/cloudy-day-1.svg';
    } else if (condition == WeatherCondition.smoke) {
      _image = 'assets/images/cloudy.svg';
    } else if (condition == WeatherCondition.haze) {
      _image = 'assets/images/cloudy.svg';
    } else if (condition == WeatherCondition.dust) {
      _image = 'assets/images/cloudy.svg';
    } else if (condition == WeatherCondition.sand) {
      _image = 'assets/images/cloudy.svg';
    } else if (condition == WeatherCondition.ash) {
      _image = 'assets/images/cloudy.svg';
    } else if (condition == WeatherCondition.squall) {
      _image = 'assets/images/cloudy.svg';
    } else if (condition == WeatherCondition.tornado) {
      _image = 'assets/images/rainy-6.svg';
    } else {
      _image = 'assets/images/cloudy.svg';
    }
    if (kIsWeb)
      return Center(
        child: Container(
          height: size.height * .35,
          width: size.width * .35,
          child: SvgPicture.asset(
            _image,
            fit: BoxFit.fill,
          ),
        ),
      );
    else if (Platform.isAndroid) {
      return Center(
        child: Container(
          height: size.height * .13,
          width: size.width * .45,
          child: SvgPicture.asset(
            _image,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          height: size.height * .13,
          width: size.width * .45,
          child: SvgPicture.asset(
            _image,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
