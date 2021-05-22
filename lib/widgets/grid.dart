import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {
  final String uvi;
  final String clouds;
  final String visibility;
  final String windgust;
  final String dewpoint;
  final String timeZone;

  const MyGrid(
      {Key key,
      @required this.uvi: '0',
      @required this.clouds: '0',
      @required this.visibility: '0',
      @required this.windgust: '0',
      @required this.dewpoint: '0',
      @required this.timeZone: '0'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('UVI'),
                      Text(
                        uvi,
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white),
                ),
                height: 120,
                width: 100,
              ),
              SizedBox(
                child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Clouds'),
                      Text(
                        clouds,
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white),
                ),
                height: 120,
                width: 100,
              ),
              SizedBox(
                child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Visibility'),
                      Text(
                        visibility,
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white),
                ),
                height: 120,
                width: 100,
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Dew Point'),
                      Text(
                        dewpoint,
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white),
                ),
                height: 120,
                width: 100,
              ),
              SizedBox(
                child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Wind gust'),
                      Text(
                        windgust,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(' meter/sec')
                    ],
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white),
                ),
                height: 120,
                width: 100,
              ),
              SizedBox(
                child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Wind Deg'),
                      Text(
                        timeZone,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text('degrees')
                    ],
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white),
                ),
                height: 120,
                width: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
