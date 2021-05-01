import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  'root': (context) => HomePage(),
  'alert': (context) => AlertPage(),
  'avatar': (context) => AvatarPage(),
  'card': (context) => CardPage(),
  'animatedContainer': (context) => AnimatedContainerPage(),
  'inputs': (context) => InputPage(),
  'slider': (context) => SliderPage(),
  'list': (context) => ListaPage(),
};
