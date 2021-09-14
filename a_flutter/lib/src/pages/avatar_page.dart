import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i2.wp.com/hipertextual.com/wp-content/uploads/2018/11/Stan-Lee.jpg"),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            fadeInDuration: Duration(milliseconds: 200),
            image: NetworkImage(
                "https://www.geekmi.news/__export/1605198940916/sites/debate/img/2020/11/12/stan_leex_su_legado_a_dos_axos_de_su_muerte.jpg_242310155.jpg")),
      ),
    );
  }
}
