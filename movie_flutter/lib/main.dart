import 'package:flutter/material.dart';
import 'package:movie_flutter/src/pages/home_page.dart';
import 'package:movie_flutter/src/pages/pelicula_detalle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'detalle': (BuildContext context) => PeliculaDetallePage()
      },
    );
  }
}
