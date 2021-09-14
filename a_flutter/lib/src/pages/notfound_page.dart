import 'package:flutter/material.dart';

class NothFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('404'),
        ),
      ),
      body: Center(
        child: Text("UH OH! You're lost."),
      ),
    );
  }
}
