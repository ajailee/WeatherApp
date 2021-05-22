import 'package:flutter/material.dart';

class Humadity extends StatelessWidget {
  final int hum;

  const Humadity({Key key, @required this.hum}) : super(key: key);
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
            Text('Humidity',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            Icon(Icons.water_outlined),
            Text(
              '$hum',
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
            Text('Humidity in %')
          ],
        ),
      ),
    );
  }
}
