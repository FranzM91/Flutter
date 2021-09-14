import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SingleCard(
              color: Colors.blue, icon: Icons.ac_unit_sharp, text: 'General'),
          _SingleCard(
              color: Colors.pink.shade900,
              icon: Icons.border_all,
              text: 'Transport'),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.green, icon: Icons.ac_unit_sharp, text: 'Grocery'),
          _SingleCard(color: Colors.blue, icon: Icons.border_all, text: 'Bill'),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.blue, icon: Icons.ac_unit_sharp, text: 'Transport'),
          _SingleCard(
              color: Colors.pink, icon: Icons.movie, text: 'Entertaiment'),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.blue, icon: Icons.ac_unit_sharp, text: 'General'),
          _SingleCard(
              color: Colors.pink.shade900,
              icon: Icons.border_all,
              text: 'Transport'),
        ])
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
          radius: 30,
          backgroundColor: this.color,
          child: Icon(
            this.icon,
            size: 35,
            color: Colors.white,
          )),
      SizedBox(height: 10),
      Text(this.text, style: TextStyle(color: this.color, fontSize: 18))
    ]));
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            // margin: EdgeInsets.all(15),
            height: 180,
            decoration: BoxDecoration(
                color: Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: this.child,
          ),
        ),
      ),
    );
  }
}
