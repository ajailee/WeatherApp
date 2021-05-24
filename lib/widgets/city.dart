import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/models/color.dart';
import 'package:today/models/locationModel.dart';
import 'package:today/provider/weatherprovider.dart';

class CityCard extends StatefulWidget {
  final String city;
  final double lat;
  final double long;

  CityCard(
      {Key key, @required this.city, @required this.lat, @required this.long})
      : super(key: key);

  @override
  _CityCardState createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  TextEditingController _lattextFieldController = TextEditingController();
  TextEditingController _longtextFieldController = TextEditingController();
  // ignore: unused_field
  LocationModel _locationModel = new LocationModel(latitude: 50, longitude: 50);
  @override
  dispose() {
    _lattextFieldController.dispose();
    _longtextFieldController.dispose();
    super.dispose();
  }

  _displayDialog(BuildContext context) async {
    WeatherProvider provider = Provider.of(context, listen: false);
    return showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: Text('Enter the coordinate'),
              content: Column(
                children: [
                  TextField(
                    controller: _lattextFieldController,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration:
                        InputDecoration(hintText: "Enter your Latitude"),
                  ),
                  TextField(
                    controller: _longtextFieldController,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration:
                        InputDecoration(hintText: "Enter your Longitude"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Paris',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 48.864716, longitude: 2.349014);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'New York ',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 40.730610, longitude: -73.935242);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'London',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 51.509865, longitude: -0.118092);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Bangkok',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 13.736717, longitude: 100.523186);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Hong Kong',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 22.302711, longitude: 114.177216);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Dubai',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 25.276987, longitude: 55.296249);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Singapore',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 1.290270, longitude: 103.851959);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Rome',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 41.902782, longitude: 12.496366);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Macau',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 22.210928, longitude: 113.552971);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Istanbul',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 41.015137, longitude: 28.979530);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Malaysia',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 3.140853, longitude: 101.693207);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Delhi',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 28.644800, longitude: 77.216721);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Tokyo',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 35.652832, longitude: 139.839478);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('408ec6'),
                                  HexColor('#7a2048'),
                                  HexColor('#1e2761')
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: new Text(
                              'Turkey',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              LocationModel locationModel = new LocationModel(
                                  latitude: 41.015137, longitude: 28.979530);
                              _locationModel = locationModel;
                              provider.changeweather(locationModel);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                // ignore: deprecated_member_use
                new FlatButton(
                  child: new Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // ignore: deprecated_member_use
                new FlatButton(
                  child: new Text('Submit'),
                  onPressed: () {
                    if (_lattextFieldController.text.isNotEmpty &&
                        _longtextFieldController.text.isNotEmpty) {
                      LocationModel locationModel = new LocationModel(
                          latitude: double.parse(_lattextFieldController.text),
                          longitude:
                              double.parse(_longtextFieldController.text));
                      _locationModel = locationModel;
                      provider.changeweather(locationModel);
                      Navigator.pop(context);
                    } else {}
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _displayDialog(context),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                '📍${widget.city}',
                style: TextStyle(
                    fontSize: widget.city.length > 10 ? 30 : 40,
                    color: Colors.white),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Text(
                '${widget.lat}  ${widget.long}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
