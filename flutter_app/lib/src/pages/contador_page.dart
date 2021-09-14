import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  // createState() {
  //   return _ContadorPageState();
  // }
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final _styleBtn = TextStyle(fontSize: 25);
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FM DevOps'),
        centerTitle: true,
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de Clicks:', style: _styleBtn),
            Text('$_counter', style: _styleBtn)
          ],
        ),
      ),
      floatingActionButton: _createBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _createBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 15),
        FloatingActionButton(
            child: Icon(Icons.exposure_zero), onPressed: _reset),
        Expanded(child: SizedBox()),
        FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(_sustraer);
            }),
        SizedBox(width: 5.0),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _agregar),
        SizedBox(width: 15)
      ],
    );
  }

  void _agregar() {
    setState(() => _counter++);
  }

  void _sustraer() {
    setState(() => {
          if (_counter > 0) {_counter--} else {_counter = 0}
        });
  }

  void _reset() {
    setState(() => _counter = 0);
  }
}
