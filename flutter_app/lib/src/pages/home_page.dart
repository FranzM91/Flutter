import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final styleBtn = TextStyle(fontSize: 25);
  final counter = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FM DevOps'),
        centerTitle: true,
        elevation: 5,
      ),
      body: Center(
        // child: Text('Número de Clicks:')
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de Clicks:', style: styleBtn),
            Text('$counter', style: styleBtn)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Hola Mundo');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
