import 'package:flutter/material.dart';

class PaypalDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 70.0),
            child: Image(
              image: AssetImage('assets/paypal.png'),
              height: 150.0,
              width: 150.0,
              alignment: Alignment.center,
            ),
          ),
          CardBtn(
              icon: Icons.people,
              title: "Paypal For Individual",
              endIcon: Icons.keyboard_arrow_right),
          SizedBox(height: 30.0),
          CardBtn(
              icon: Icons.home,
              title: "Paypal For Business",
              endIcon: Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}

class CardBtn extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData endIcon;
  const CardBtn({
    Key? key,
    required this.icon,
    required this.title,
    required this.endIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 25.0),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Color(0xff222d65),
      // child: ListTile(
      //     leading: Icon(
      //       this.icon,
      //       color: Colors.white,
      //     ),
      //     title: Text(this.title,
      //         style: TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //             fontStyle: FontStyle.italic)),
      //     trailing: Icon(this.endIcon, color: Colors.white)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(this.icon, color: Colors.white),
            Text(this.title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 16)),
            Icon(this.endIcon, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
