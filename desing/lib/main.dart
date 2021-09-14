import 'package:desing/screens/home_page.dart';
import 'package:desing/screens/home_screen.dart';
import 'package:desing/screens/paypal_design.dart';
import 'package:desing/screens/paypal_login.dart';
import 'package:desing/screens/scroll_screen.dart';
import 'package:desing/screens/basic_design.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // cambiar el color del body del phone
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_page',
      // Cambiar el color de fondo
      // theme: ThemeData.dark(),
      routes: {
        'home_page': (_) => HomePage(),
        'basic_design': (_) => BasicDesignScreen(),
        'scroll_screen': (_) => ScrollScreen(),
        'paypal_screen': (_) => PaypalDesign(),
        'login_screen': (_) => PaypalLoginPage(),
        'home_screen': (_) => HomeScreen()
      },
    );
  }
}
