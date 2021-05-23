import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
  final String condition;

  const Temp({Key key, @required this.condition}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final c = double.parse(condition) - 273.15;
    String cel = c.toStringAsFixed(2);
    return Container(
      child: Text(
        '🌡️' + cel + " \u2103",
        style: TextStyle(fontSize: 45, color: Colors.white),
      ),
    );
  }
}
