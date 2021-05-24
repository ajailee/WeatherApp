import 'package:flutter/material.dart';
import 'package:today/screens/leftScreen.dart';
import 'package:today/screens/newhome.dart';
import 'package:today/screens/rightScreen.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        LeftScreen(),
        NewHomeScreen(),
        RightScreen(),
      ],
    );
  }
}
