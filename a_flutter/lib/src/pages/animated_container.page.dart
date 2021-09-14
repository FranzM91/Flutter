import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeState();
        },
        child: Icon(Icons.autorenew),
      ),
    );
  }

  void _changeState() {
    setState(() {
      _width = _randomNumber(300);
      _height = _randomNumber(300);
      _color = Color.fromRGBO(
          _randomColor(255), _randomColor(255), _randomColor(255), 1);
      _borderRadius = BorderRadius.circular(_randomNumber(100));
    });
  }

  double _randomNumber(int max) {
    var rng = new Random();
    print(rng.nextInt(max).toDouble());
    return rng.nextInt(max).toDouble();
  }

  int _randomColor(int max) {
    var rng = new Random();
    return rng.nextInt(max);
  }
}
