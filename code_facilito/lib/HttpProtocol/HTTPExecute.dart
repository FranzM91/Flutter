import 'package:code_facilito/Common/Constant.dart';
import 'package:code_facilito/Common/Validate.dart';
import 'package:http/http.dart' as http;

class HTTPExecute {
  String endPointUrl;
  var url;
  HTTPExecute(this.endPointUrl) {
    url = Uri.parse(this.endPointUrl);
  }

  get() async {
    return await Validate.connectionError(method: loadGet);
  }

  post(Map parameters) async {
    return await Validate.connectionError(
        methodParam: loadPost(parameters), parameters: parameters);
  }

  put(Map parameters) async {
    return await Validate.connectionError(
        methodParam: loadPut(parameters), parameters: parameters);
  }

  delete() async {
    return await Validate.connectionError(method: loadDelete);
  }

  loadGet() async {
    var response = await http.get(this.url);
    return validateResponse(response);
  }

  loadPost(Map param) async {
    var response = await http.post(this.url, body: param);
    return validateResponse(response);
  }

  loadDelete() async {
    var response = await http.delete(this.url);
    return validateResponse(response);
  }

  loadPut(Map param) async {
    var response = await http.put(this.url, body: param);
    return validateResponse(response);
  }

  validateResponse(response) {
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? response.body.toString()
        : Validate.errorWidget(Constant.SERVER_ERROR,
            content: "${response.statusCode}");
  }
}
