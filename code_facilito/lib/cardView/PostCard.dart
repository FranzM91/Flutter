import 'package:code_facilito/Class/Post.dart';
import 'package:code_facilito/Class/User.dart';
import 'package:code_facilito/Page/FormPostPage.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  Post post;
  User user;
  PostCard(this.post, this.user);
  @override
  State<StatefulWidget> createState() => PostCardState(this.post);
}

class PostCardState extends State<PostCard> {
  Post post;
  PostCardState(this.post);
  User userPost = User();

  @override
  void initState() {
    this.getUserPost();
  }

  getUserPost() async {
    var user = await User().getUser();
    if (user != null && user is! Widget) {
      setState(() {
        this.userPost = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => goFormPage(context),
      child: Card(
        child: Column(
          children: <Widget>[
            Text(post.title),
            Text(post.body),
            Text(this.userPost.Code)
          ],
        ),
      ),
    );
  }

  goFormPage(context) {
    if (widget.user.Id == userPost.Id) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FormPostPage()));
    }
  }
}
