import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final _opciones = [
    'Un',
    'Deux',
    'Trois',
    'Quatre',
    'Cinq',
    'Six',
    'Sept',
    'Huit',
    'Neuf',
    'Dix',
  ];
/*
  List<Widget> _crearItems() {
    List<Widget> lista = [];

    for (var option in _opciones) {
      final tempWidget = ListTile(title: Text(option));
      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Temporal')),
      // body: ListView(children: _crearItems()),
      body: ListView(
          children: _opciones.map((item) {
        return ListTile(
            title: Text(item),
            subtitle: Text(item),
            leading: Icon(Icons.confirmation_number_outlined),
            trailing: Icon(Icons.navigate_next_rounded),
            onTap: () {
              print("Tapped $item");
            });
      }).toList()),
    );
  }
}
