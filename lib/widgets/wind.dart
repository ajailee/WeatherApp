import 'package:flutter/material.dart';

class Wind extends StatelessWidget {
  final double wind;

  const Wind({Key key, @required this.wind}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.21,
      child: Card(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text('Wind Speed',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            Icon(Icons.air),
            Text(
              '$wind',
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
            Text('meter/sec'),
          ],
        ),
      ),
    );
  }
}
