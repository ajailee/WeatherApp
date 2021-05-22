import 'package:flutter/material.dart';

class RightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('loc'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.blue,
      ),
    );
  }
}
