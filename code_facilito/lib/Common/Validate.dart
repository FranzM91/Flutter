import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'Constant.dart';

typedef void VoidCallBackParam(var parameter);

class Validate {
  var data;
  Validate(this.data);

  static Widget errorWidget(String error, {String content = ""}) {
    var sms = "";
    switch (error) {
      case Constant.CONNECTION_DISABLED:
        // return textError("Error en la conexión $content");
        sms = "Error en la conexión $content";
        break;
      case Constant.WIFI_DISABLED:
        // return textError("Error en la conexión wifi $content");
        sms = "Error en la conexión wifi $content";
        break;
      case Constant.SERVER_ERROR:
        // return textError("Error en el servidor $content");
        sms = "Error en el servidor $content";
        break;
      case Constant.MESSAGE:
        // return textError(content);
        sms = "$content";
        break;
    }
    return textError(sms);
  }

  static textError(text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 40),
    );
  }

  static emptyMap(paramenters) {
    return paramenters.toString() == "[]" ? null : paramenters;
  }

  static connectionError(
      {VoidCallback? method,
      VoidCallBackParam? methodParam,
      Map? parameters}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return errorWidget(Constant.CONNECTION_DISABLED);
    } else {
      return (emptyMap(parameters) != null)
          ? methodParam!(parameters!)
          : method!();
    }
  }

  isWidget(VoidCallBackParam method) {
    return (data is Widget)
        ? data
        : data.isNotEmpty
            ? method(json.decode(data))
            : null;
  }

  keyExists(String key, {var defaul = ""}) {
    return (data.containsKey(key) && data[key] != null) ? data[key] : defaul;
  }

  //  Validar Enteros
  int checkInteger(var data) {
    return (data is String) ? int.parse(data) : data;
  }
}
