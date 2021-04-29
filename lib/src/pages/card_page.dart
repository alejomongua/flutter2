import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
        ],
      ),
    );
  }
}

Widget _cardTipo1() => Card(
        child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.photo_album_outlined, color: Colors.blue[600]),
          title: Text('Card title'),
          subtitle: Text(
              'Contenido de la tarjeta, es un texto largo porque la letra es más pequeñita'),
        ),
        Row(
          children: [
            TextButton(onPressed: () {}, child: Text('Ok')),
            TextButton(onPressed: () {}, child: Text('Cancelar'))
          ],
        )
      ],
    ));

Widget _cardTipo2() => Card(
        child: Column(
      children: [
        FadeInImage(
          placeholder: AssetImage('assets/loading-icon-gif-6.gif'),
          image: NetworkImage(
              'https://wallpapertag.com/wallpaper/full/d/3/c/968676-hi-res-background-images-2651x1813-retina.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
        Container(padding: EdgeInsets.all(10.0), child: Text('Bonito paisaje'))
      ],
    ));
