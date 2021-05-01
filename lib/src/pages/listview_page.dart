import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List _listaNumeros;

  ScrollController _scrollController = ScrollController();

  int _ultimoNumero = 0;

  bool _cargando = false;

  @override
  void initState() {
    super.initState();
    _listaNumeros = [];

    _agregarMas();

    _scrollController.addListener(() {
      ScrollPosition pos = _scrollController.position;
      if (pos.pixels >= pos.maxScrollExtent - 100) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Para prevenir fugas de memoria
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(children: [
        _crearLista(),
        _crearLoading(),
      ]),
    );
  }

  _crearLista() => RefreshIndicator(
        onRefresh: () async {
          return Timer(Duration(seconds: 2), () {
            _listaNumeros.clear();
            _ultimoNumero++;
            _agregarMas();
          });
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (context, index) {
            final image = _listaNumeros[index];

            return FadeInImage(
              placeholder: AssetImage('assets/loading-icon-gif-6.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$image'),
            );
          },
        ),
      );

  _agregarMas() {
    for (var i = 0; i < 5; i++) {
      setState(() {
        _listaNumeros.add(++_ultimoNumero);
      });
    }
  }

  _fetchData() async {
    setState(() {
      _cargando = true;
    });
    return Timer(Duration(seconds: 2), () {
      _agregarMas();
      _cargando = false;
      _scrollController.animateTo(_scrollController.position.pixels + 100,
          duration: Duration(
            milliseconds: 250,
          ),
          curve: Curves.linear);
    });
  }

  _crearLoading() {
    if (_cargando) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 20,
          )
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
      );
    }

    return Container();
  }
}
