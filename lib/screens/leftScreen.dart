import 'package:flutter/material.dart';

class LeftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.blue,
      ),
    );
  }
}
