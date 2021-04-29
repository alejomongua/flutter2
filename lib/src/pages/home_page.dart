import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Componentes')), body: _lista());
  }

  _lista() {
    return FutureBuilder(
        future: menuProvider.cargarData(),
        // initialData: [],
        builder: (context, snapshot) => ListView(
              children: _crearHijos(snapshot.data, context),
            ));
  }

  List<Widget> _crearHijos(List<dynamic> objects, context) {
    if (objects == null) {
      return [];
    }

    return objects
        .map((element) => ListTile(
              title: Text(element['texto']),
              leading: Icon(getIcon(element['icon']), color: Colors.blue[500]),
              trailing: Icon(Icons.arrow_forward, color: Colors.blue[500]),
              onTap: () {
                Navigator.pushNamed(context, element['ruta']);
              },
            ))
        .toList();
  }
}
