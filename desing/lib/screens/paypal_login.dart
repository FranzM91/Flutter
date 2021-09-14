import 'dart:ui';

import 'package:flutter/material.dart';

class PaypalLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 80.0),
              child: Center(
                child: Image(
                  image: AssetImage('assets/paypal.png'),
                  height: 150.0,
                  width: 150.0,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Text("Paypal For Individual",
                style: TextStyle(
                    color: Color(0xff222d65),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 18)),
            SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Color(0xff222d65))),
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Password",
                    hintText: "********",
                    labelStyle: TextStyle(color: Color(0xff222d65)),
                    suffixIcon: Icon(Icons.security)),
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            Expanded(child: Container()),
            Text("New to Paypal? Sign up",
                style: TextStyle(
                    color: Color(0xff222d65),
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20.0),
          ],
        ),
        // bottomNavigationBar: Container(
        //     color: Color(0xff222d65),
        //     child: ListTile(
        //       title: Text("Login",
        //           style: TextStyle(color: Colors.white),
        //           textAlign: TextAlign.center),
        //       onTap: () {
        //         // Navigator.pushNamed(context, "");
        //       },
        //     )));

        bottomNavigationBar: Container(
            height: 60.0,
            color: Color(0xff222d65),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(getColor),
              ),
              child: Text("Login",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            )));
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Color(0xff222d65);
  }
}
