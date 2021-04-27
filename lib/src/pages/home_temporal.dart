import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Temporal')),
      body: ListView(children: [
        ListTile(title: Text('Tile title')),
        Divider(),
        ListTile(title: Text('Tile title')),
        Divider(),
        ListTile(title: Text('Tile title')),
      ]),
    );
  }
}
