// void main() {
//   final cuadrado = new Cuadrado();
//   cuadrado.lado = 10;
//   print( cuadrado );
//   print('area: ${cuadrado.area}');
// }

// class Cuadrado {
//   double _lado;
//   double _area;
//   Cuadrado();
//   set lado(double valor){
//     if ( valor <= 0 ) {
//       throw('El lado no puede ser menor a 0');
//     }
//     _lado = valor;
//   }
// //   double get area {
// //     return _lado * _lado;
// //   }
//   double get area => _lado * _lado;
//   toString() => 'Lado: $_lado';
