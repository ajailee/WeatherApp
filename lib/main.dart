import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:today/provider/airPollutionProvider.dart';
import 'package:today/provider/weatherprovider.dart';
import 'package:today/screens/onboadingpage.dart';
import 'package:today/service/locationService.dart';

import 'screens/pageview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences preferences;
  bool firstRun = true;

  @override
  void initState() {
    getresults();
    super.initState();
  }

  Future<bool> getresults() async {
    preferences = await SharedPreferences.getInstance();
    firstRun = preferences.getBool('firstRun');
    print(firstRun);
    if (firstRun == null) {
      firstRun = true;
    }
    return firstRun;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: WeatherProvider()),
        ChangeNotifierProvider.value(value: AirPollutionProvider()),
        ChangeNotifierProvider.value(value: MyLocation()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: FutureBuilder(
          future: getresults(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              if (!snapshot.data == null ? true : snapshot.data) {
                return Scaffold(body: OnBoardingPage());
              } else {
                return Scaffold(body: PageViewDemo());
              }
            }
          },
        ),
      ),
    );
  }
}
