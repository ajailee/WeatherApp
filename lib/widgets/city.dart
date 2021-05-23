import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String city;
  final double lat;
  final double long;

  const CityCard(
      {Key key, @required this.city, @required this.lat, @required this.long})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              '📍$city',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Text('$lat  $long'),
          ],
        ),
      ),
    );
  }
}
