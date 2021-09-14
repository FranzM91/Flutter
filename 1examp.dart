import 'dart:convert';

void main() {
//   for (int i = 0; i < 5; i++) {
//     print('hello ${i + 1}');
//   }
  Map<int, String> personas = {1: 'Tony', 2: 'Tomas', 9: 'Misi'};
  personas.addAll({4: 'Banner'});
  print(personas);
  print(personas[9]);

  // print(saludar(nombre: 'Frank', apellido: 'Mamani'));

  final rawJson = '{"nombre": "Logan", "poder": "Regneracion"}';
  Map parseJson = json.decode(rawJson);
  // final wolwerine = new Hero.fromJson(parseJson);
  // print(wolwerine.nombre);
  // print(wolwerine.poder);
}
// String saludar({String nombre, String apellido}) {
//   return 'Hola $nombre - $apellido';
// }

class Hero {
  String nombre;
  String poder;
  Hero(this.nombre, this.poder);

  // Hero.fromJson(Map parseJson){
  //   nombre = parseJson['nombre'];
  //   poder = parseJson['poder'];

  // }
}
