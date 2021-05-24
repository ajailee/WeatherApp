import 'package:flutter/material.dart';
import 'package:today/models/forecastModel.dart';
import 'package:today/widgets/FeelsLike.dart';
import 'package:today/widgets/city.dart';
import 'package:today/widgets/grid.dart';
import 'package:today/widgets/humadity.dart';
import 'package:today/widgets/icon.dart';
import 'package:today/widgets/temp.dart';
import 'package:today/widgets/temprow.dart';
import 'package:today/widgets/wind.dart';
import '/provider/weatherprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherProvider>(context);

    return Center(
      child: FutureBuilder(
          future: weather.currentWeather(),
          builder: (context, AsyncSnapshot<ForecaseModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final data = snapshot.data;
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: data.isDayTime
                        ? AssetImage("assets/images/sunny.jpg")
                        : AssetImage("assets/images/night.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                // gradient: data.isDayTime
                //     ? LinearGradient(
                //         begin: Alignment.topLeft,
                //         end: Alignment.bottomRight,
                //         colors: [Colors.blue, Colors.blue[200]])
                //     : LinearGradient(
                //         begin: Alignment.topLeft,
                //         end: Alignment.bottomRight,
                //         colors: [Colors.indigo[800], Colors.indigo[600]])),
                child: kIsWeb
                    ? Scaffold(
                        backgroundColor: Colors.transparent,
                        body: SingleChildScrollView(
                          child: SafeArea(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Column(
                                        children: [
                                          TempIcon(
                                            condition: data.current.condition,
                                          ),
                                          FeelsLike(
                                            feelsLike: data.current.feelLikeTemp
                                                .toString(),
                                            desc: data.current.description,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Temp(
                                    condition: data.current.temp.toString(),
                                  ),
                                  CityCard(
                                    city: data.city,
                                    lat: data.latitude,
                                    long: data.longitude,
                                  ),
                                  TempRow(data.current.temp.toString()),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Wind(
                                        wind: data.current.windSpeed,
                                      ),
                                      Humadity(
                                        hum: data.current.humidity,
                                      ),
                                    ],
                                  ),
                                  MyGrid(
                                    uvi: data.current.uvi.toString(),
                                    clouds: data.current.cloudiness.toString(),
                                    dewpoint: data.current.dewpoint.toString(),
                                    timeZone: data.current.winddeg.toString(),
                                    visibility:
                                        data.current.visibility.toString(),
                                    windgust: data.current.windgust.toString(),
                                  ),
                                  Text('Last Update:' +
                                      data.lastupdated.toString())
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Scaffold(
                        backgroundColor: Colors.transparent,
                        body: SingleChildScrollView(
                          child: SafeArea(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CityCard(
                                    city: data.city,
                                    lat: data.latitude,
                                    long: data.longitude,
                                  ),
                                  Temp(
                                    condition: data.current.temp.toString(),
                                  ),
                                  Row(
                                    children: [
                                      TempIcon(
                                        condition: data.current.condition,
                                      ),
                                      FeelsLike(
                                        feelsLike: data.current.feelLikeTemp
                                            .toString(),
                                        desc: data.current.description,
                                      )
                                    ],
                                  ),
                                  TempRow(data.current.temp.toString()),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Wind(
                                        wind: data.current.windSpeed,
                                      ),
                                      Humadity(
                                        hum: data.current.humidity,
                                      ),
                                    ],
                                  ),
                                  MyGrid(
                                    uvi: data.current.uvi.toString(),
                                    clouds: data.current.cloudiness.toString(),
                                    dewpoint: data.current.dewpoint.toString(),
                                    timeZone: data.current.winddeg.toString(),
                                    visibility:
                                        data.current.visibility.toString(),
                                    windgust: data.current.windgust.toString(),
                                  ),
                                  Text(
                                    '⏲️ Last Update:' +
                                        data.lastupdated.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(padding: EdgeInsets.all(10))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              );
            }
          }),
    );
  }
}
