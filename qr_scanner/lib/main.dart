import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/mapa_page.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => new UiProvider())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR reader',
          initialRoute: 'home',
          routes: {
            'home': (_) => HomePage(),
            'mapa': (_) => MapaPage(),
          },
          theme: ThemeData(
            primaryColor: Colors.deepPurple,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple),
            // bottomNavigationBarTheme:
            //     BottomNavigationBarThemeData(backgroundColor: Colors.deepPurple)
          ),
        ));
  }
}
