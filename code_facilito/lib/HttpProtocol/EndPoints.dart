import 'package:code_facilito/Common/Constant.dart';
import 'package:code_facilito/HttpProtocol/HTTPExecute.dart';

class EndPoint {
  static getUser() {
    return HTTPExecute(generateEndPointUrl("/getCountry")).get();
  }

  static getPosts() {
    return HTTPExecute(generateEndPointUrl("/all")).get();
  }

  static insertPosts(parameters) {
    return HTTPExecute(generateEndPointUrl("/posts")).post(parameters);
  }

  static updatePosts(parameters) {
    return HTTPExecute(generateEndPointUrl("/posts/${parameters['id']}"))
        .put(parameters);
  }

  static deletePosts(id) {
    return HTTPExecute(generateEndPointUrl("/posts/$id")).delete();
  }

  static generateEndPointUrl(resource) {
    return Constant.DOMAIN + "${Constant.PATH}$resource";
  }
}
