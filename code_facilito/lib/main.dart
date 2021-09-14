import 'package:code_facilito/Class/User.dart';
import 'package:code_facilito/cardView/PostCard.dart';
import 'package:flutter/material.dart';

import 'Class/Post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<AnimatedListState> key = GlobalKey();
  User user = User();
  var data;

  @override
  void initState() {
    getProfile();
    // getListPost();
  }

  getProfile() async {
    var user = await User().getUser();
    print(":: $user");
    if (user != null && user is! Widget) {
      setState(() {
        this.user = user;
      });
    }
  }

  getListPost() async {
    var data = await Post().getPosts();
    setState(() {
      this.data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(this.user.Name),
              accountEmail: Text(this.user.Code),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: (this.data is Widget)
          ? this.data
          : (this.data != null)
              ? loadListView
              : LinearProgressIndicator(),
      floatingActionButton: FloatingActionButton(
        onPressed: newPost,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  newPost() {}

  loadListView() {
    return AnimatedList(
      key: key,
      initialItemCount: this.data.length,
      shrinkWrap: false,
      itemBuilder: (context, index, animation) {
        return PostCard(this.data[index], this.user);
      },
    );
  }
}
