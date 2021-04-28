import 'package:componentes/src/providers/menu_provider.dart';
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
        builder: (context, snapshot) {
          return ListView(
            children: _crearHijos(snapshot.data),
          );
        });
  }

  List<Widget> _crearHijos(List<dynamic> objects) {
    return objects.map((element) {
      print(element);
      return ListTile(
        title: Text(element['texto']),
        leading: Icon(Icons.account_circle, color: Colors.blue[500]),
        trailing: Icon(Icons.arrow_forward, color: Colors.blue[500]),
        onTap: () {
          print(element['ruta']);
        },
      );
    }).toList();
  }
}
