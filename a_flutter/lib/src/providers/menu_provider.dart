import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    // cargarDate();
  }

  Future<List<dynamic>> cargarDate() async {
    // rootBundle.loadString('data/menu_opts.json').then((data) {
    //   Map dataMap = json.decode(data);
    //   print(dataMap);
    //   opciones = dataMap['rutas'];
    // });
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
