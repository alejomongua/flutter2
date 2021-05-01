import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List _listaNumeros;

  ScrollController _scrollController = ScrollController();

  int _ultimoNumero = 0;

  @override
  void initState() {
    super.initState();
    _listaNumeros = [];

    _agregarMas();

    _scrollController.addListener(() {
      ScrollPosition pos = _scrollController.position;
      if (pos.pixels == pos.maxScrollExtent - 100) {
        _agregarMas();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _crearLista(),
    );
  }

  _crearLista() => ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (context, index) {
          final image = _listaNumeros[index];

          return FadeInImage(
            placeholder: AssetImage('assets/loading-icon-gif-6.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
          );
        },
      );

  _agregarMas() {
    for (var i = 1; i <= 10; i++) {
      setState(() {
        _listaNumeros.add(++_ultimoNumero);
      });
    }
  }
}
