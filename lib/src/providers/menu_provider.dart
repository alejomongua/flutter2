import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show json;

class _MenuProvider {
  Future<List<dynamic>> cargarData() async {
    String data = await rootBundle.loadString('data/menu_opts.json');
    Map decoded = json.decode(data);
    List<dynamic> opciones = decoded['rutas'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
