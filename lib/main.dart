import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/provider/weatherprovider.dart';
import '/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => WeatherProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}
