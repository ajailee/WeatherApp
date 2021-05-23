import 'package:flutter/material.dart';

class MyGrid extends StatefulWidget {
  final String uvi;
  final String clouds;
  final String visibility;
  final String windgust;
  final String dewpoint;
  final String timeZone;

  MyGrid(
      {Key key,
      @required this.uvi: '0',
      @required this.clouds: '0',
      @required this.visibility: '0',
      @required this.windgust: '0',
      @required this.dewpoint: '0',
      @required this.timeZone: '0'})
      : super(key: key);

  @override
  _MyGridState createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
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
                          widget.uvi,
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
                          widget.clouds,
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
                          widget.visibility,
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
                          widget.dewpoint,
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
                          widget.windgust,
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
                          widget.timeZone,
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
      ),
    );
  }
}
