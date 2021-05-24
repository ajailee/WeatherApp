import 'package:flutter/material.dart';

class FeelsLike extends StatelessWidget {
  final String feelsLike;
  final String desc;

  const FeelsLike({Key key, @required this.feelsLike, @required this.desc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final c = double.parse(feelsLike) - 273.15;
    String cel = c.toStringAsFixed(2);
    return Container(
      child: Column(
        children: [
          Text(
            cel + "°C",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            desc,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
