import 'package:code_facilito/Common/Validate.dart';
import 'package:code_facilito/HttpProtocol/EndPoints.dart';

class User {
  String Id;
  String Name;
  String Code;
  // String apellido;
  // String telefono;
  // String email;
  // String mensaje;

  User({
    this.Id = "",
    this.Name = "",
    this.Code = "",
  });

  factory User.fromJson(Map<dynamic, dynamic> data) {
    if (data == null) {
      return User();
    }
    Validate validate = Validate(data);
    return User(
        Id: validate.keyExists("Id"),
        Name: validate.keyExists('Name'),
        Code: validate.keyExists('Code')
        // telefono: validate.keyExists('telefono'),
        // email: validate.keyExists('email'),
        // mensaje: validate.keyExists('mensaje')
        );
  }

  Future getUser() async {
    var data = await EndPoint.getUser();
    return Validate(data).isWidget(getObjet);
  }

  getObjet(data) {
    return User.fromJson(data);
  }
}
