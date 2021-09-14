import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/contador_page.dart';
// import 'package:flutter_app/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        // child: Text('Hola Mundo!')
        // child: HomePage(),
        child: ContadorPage(),
      ),
    );
  }
}
