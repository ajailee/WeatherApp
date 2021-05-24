import 'package:flutter/material.dart';

class TempRow extends StatelessWidget {
  final String condition;
  TempRow(this.condition);
  @override
  Widget build(BuildContext context) {
    final f = 1.8 * (double.parse(condition) - 273) + 32;
    String fah = f.toStringAsFixed(2);
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Kelvin:$condition k',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            'Fahrenheit:$fah°F',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
