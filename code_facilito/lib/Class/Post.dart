import 'package:code_facilito/Common/Validate.dart';
import 'package:code_facilito/HttpProtocol/EndPoints.dart';

class Post {
  int id;
  String title;
  String body;
  Post({this.id = 0, this.title = "", this.body = ""});

  factory Post.fromJson(Map<dynamic, dynamic> data) {
    if (data == null) {
      return Post();
    }
    Validate validate = Validate(data);
    return Post(
        id: validate.keyExists("id", defaul: 0),
        title: validate.keyExists('title'),
        body: validate.keyExists('body'));
  }

  Future getPosts() async {
    var date = await EndPoint.getPosts();
    return Validate(date).isWidget(getList);
  }

  getList(data) {
    return (data as List).map((map) => Post.fromJson(map)).toList();
  }
}
