import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:today/models/forecastModel.dart';
import 'package:today/models/weatherModel.dart';
import 'package:today/provider/weatherprovider.dart';

import 'package:today/widgets/city.dart';
import 'package:today/widgets/icon.dart';
import 'package:today/widgets/temp.dart';

class LeftScreen extends StatefulWidget {
  @override
  _LeftScreenState createState() => _LeftScreenState();
}

class _LeftScreenState extends State<LeftScreen> {
  var _humidity;
  var _windspeed;
  var _temp = '0.0';
  var _uv;
  var _desc = 'N/A';

  var _date = DateTime.now();
  var _city;
  var _lat;
  var _long;
  var _condition;
  var _tap = false;
  bool _init = true;

  @override
  void initState() {
    super.initState();
  }

  DateFormat f = new DateFormat.E();
  DateFormat nf = new DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _tap
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.blue[500],
                          image: DecorationImage(
                            image: AssetImage("assets/images/rainy.jpg"),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.dstATop),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(10.0, 10.0),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                            ),
                          ]),
                      child: SafeArea(
                        child: Column(
                          children: [
                            CityCard(city: _city, lat: _lat, long: _long),
                            Temp(condition: _temp),
                            Row(
                              children: [
                                TempIcon(condition: _condition),
                                Text(
                                  _desc +
                                      '\n' +
                                      _date.toString().substring(0, 11),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'UVI',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text('☢️'),
                                      Text(
                                        _uv.toString(),
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      )
                                    ],
                                  )),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Wind Speed',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text('💨'),
                                      Text(
                                        _windspeed.toString(),
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      )
                                    ],
                                  )),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Humidity',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text('💧'),
                                      Text(
                                        _humidity.toString(),
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      )
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  color: Colors.blue,
                  height: 120,
                  child: Center(
                    child: Text(
                      'Tap To See More Details',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
          Container(
            height: _tap
                ? MediaQuery.of(context).size.height * .45
                : MediaQuery.of(context).size.height * .60,
            child: FutureBuilder(
              future: weather.currentWeather(),
              builder: (context, AsyncSnapshot<ForecaseModel> snapshot) {
                var data = snapshot.data;

                return ListView.builder(
                  itemCount: data == null ? 0 : data.daily.length,
                  itemBuilder: (context, index) {
                    WeatherModel model = data.daily[index];
                    final c = (model.temp) - 273.15;
                    String cel = c.toStringAsFixed(2);
                    if (_init) {}
                    return Container(
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            _tap = true;
                            _humidity = model.humidity.toString();
                            _windspeed = model.windSpeed.toString();
                            _condition = model.condition;
                            _desc = model.description.toString();
                            _uv = model.uvi;
                            _temp = model.temp.toString();

                            _date = model.date;
                            _city = data.city;
                            _lat = data.latitude;
                            _long = data.longitude;
                          });
                        },
                        title: Column(
                          children: [
                            Text(
                              cel + "°C",
                              style: TextStyle(color: Colors.white),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     Text('Des:' + model.description),
                            //     Text('UVI:${model.uvi}'),
                            //     Text('C:${model.cloudiness}'),
                            //     Text('H:${model.humidity}'),
                            //     Text('WS:${model.windSpeed}'),
                            //     Text('DP:${model.dewpoint}')
                            //   ],
                            // ),
                          ],
                        ),
                        leading: Text(
                          f.format(model.date).substring(0, 3),
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: CircleAvatar(
                          radius: 20,
                          child: TempIcon(
                            condition: model.condition,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
