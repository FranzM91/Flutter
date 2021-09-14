import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image(image: AssetImage('assets/image.jpg')),
          // Titulo
          Title(),
          // Button Section
          ButtonSection(),

          // Description
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Jimmy Mcintyre is a travel photographer and educator. His photos have been published in local and national magazines, including the BBC. His online courses on digital blending and post-processing can be found in his official website. You can also check out his exclusive tutorials on 500px ISO here. In this tutorial, Jimmy shares his expert tips and videos on post-processing landscape photos. Read on and get inspired!',
                textAlign: TextAlign.justify,
              ))
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CustomButton(icon: Icons.call, text: 'Call'),
            CustomButton(icon: Icons.map, text: 'Route'),
            CustomButton(icon: Icons.share, text: 'Shared'),
          ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomButton({
    required this.icon,
    required this.text,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(this.icon, color: Colors.blueAccent, size: 30),
        Text(this.text, style: TextStyle(color: Colors.blueAccent, height: 2.0))
      ],
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Oeschinen Lake Campground',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16, height: 2.0)),
              Text('Kandersteg, Switzeland',
                  style: TextStyle(color: Colors.black45, height: 2.0)),
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.star, color: Colors.red),
          Text('41')
        ],
      ),
    );
  }
}
