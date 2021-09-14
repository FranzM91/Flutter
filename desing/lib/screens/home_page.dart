import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text("Paypal Template Login"),
      ),
      body: Column(
        children: <Widget>[
          _createMenu(context, 'Basic Login', 'basic_design'),
          _createMenu(context, 'Scroll Screen', 'scroll_screen'),
          _createMenu(context, 'Paypal Login', 'paypal_screen'),
          _createMenu(context, 'Paypal Form', 'login_screen'),
          _createMenu(context, 'Home Screen', 'home_screen'),
        ],
      ),
    );
  }

  ListTile _createMenu(BuildContext context, String title, String urlPage) {
    return ListTile(
      title: Text(title),
      leading: Icon(Icons.adb_sharp),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
      onTap: () {
        Navigator.pushNamed(context, urlPage);
      },
    );
  }
}
