import 'package:flutter/material.dart';

import 'package:componentes/src/pages/home_temporal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        home: HomePageTemp());
  }
}
