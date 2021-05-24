import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:today/models/airPollution.dart';
import 'package:today/models/color.dart';
import 'package:today/provider/airPollutionProvider.dart';

class RightScreen extends StatefulWidget {
  @override
  _RightScreenState createState() => _RightScreenState();
}

class _RightScreenState extends State<RightScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _controller.forward();
    super.initState();
  }

  DateFormat f = DateFormat('yyyy-MM-hh');
  @override
  Widget build(BuildContext context) {
    AirPollutionProvider provider = Provider.of<AirPollutionProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/cloudy.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder(
              future: provider.getAirPollution(),
              builder: (context, AsyncSnapshot<AirPollutionModel> snapshot) {
                var data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.hasError ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return FadeTransition(
                    opacity: _animation,
                    child: SafeArea(
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[500],
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(10.0, 10.0),
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Air Pollution',
                                    style: TextStyle(
                                        fontSize: 50, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  child: Container(
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
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'AQI',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data == null
                                              ? '1'
                                              : data.aqi.toString() ?? '0',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                  ),
                                  height: 120,
                                  width: 100,
                                ),
                                SizedBox(
                                  child: Container(
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'CO',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data.co.toString(),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            HexColor('408ec6'),
                                            HexColor('#7a2048'),
                                            HexColor('#1e2761')
                                          ]),
                                    ),
                                  ),
                                  height: 120,
                                  width: 100,
                                ),
                                SizedBox(
                                  child: Container(
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'NO',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data.no.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            HexColor('408ec6'),
                                            HexColor('#7a2048'),
                                            HexColor('#1e2761')
                                          ]),
                                    ),
                                  ),
                                  height: 120,
                                  width: 100,
                                )
                              ],
                            ),
                            //const Padding(padding: EdgeInsets.all(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  child: Container(
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'NO2',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data.no2.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            HexColor('408ec6'),
                                            HexColor('#7a2048'),
                                            HexColor('#1e2761')
                                          ]),
                                    ),
                                  ),
                                  height: 120,
                                  width: 100,
                                ),
                                SizedBox(
                                  child: Container(
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'O3',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data.o3.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            HexColor('408ec6'),
                                            HexColor('#7a2048'),
                                            HexColor('#1e2761')
                                          ]),
                                    ),
                                  ),
                                  height: 120,
                                  width: 100,
                                ),
                                SizedBox(
                                  child: Container(
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'SO2',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data.so2.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            HexColor('408ec6'),
                                            HexColor('#7a2048'),
                                            HexColor('#1e2761')
                                          ]),
                                    ),
                                  ),
                                  height: 120,
                                  width: 100,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  child: Container(
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'pm2.5',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data.pm2_5.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            HexColor('408ec6'),
                                            HexColor('#7a2048'),
                                            HexColor('#1e2761')
                                          ]),
                                    ),
                                  ),
                                  height: 120,
                                  width: 100,
                                ),
                                SizedBox(
                                  child: Container(
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'pm10',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data.pm10.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            HexColor('408ec6'),
                                            HexColor('#7a2048'),
                                            HexColor('#1e2761')
                                          ]),
                                    ),
                                  ),
                                  height: 120,
                                  width: 100,
                                ),
                                SizedBox(
                                  child: Container(
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'nh3',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data.nh3.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            HexColor('408ec6'),
                                            HexColor('#7a2048'),
                                            HexColor('#1e2761')
                                          ]),
                                    ),
                                  ),
                                  height: 120,
                                  width: 100,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              })),
    );
  }
}
