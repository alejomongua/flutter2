import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  static const double MAX_WIDTH = 400.0;
  double _valor = MAX_WIDTH;
  bool _bloquear = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  _crearSlider() => Slider(
        value: _valor,
        activeColor: Colors.black,
        label: 'Tamaño',
        divisions: 20,
        max: MAX_WIDTH,
        min: 100,
        onChanged: _bloquear
            ? null
            : (value) {
                setState(() {
                  _valor = value;
                });
              },
      );

  _crearImagen() => Image(
        image: NetworkImage(
            'https://img-9gag-fun.9cache.com/photo/aDd64E7_700bwp.webp'),
        width: _valor,
        fit: BoxFit.contain,
      );

  _crearCheckbox() => CheckboxListTile(
        title: Text('Bloquear'),
        value: _bloquear,
        onChanged: (checked) {
          setState(() {
            _bloquear = checked;
          });
        },
      );

  _crearSwitch() => SwitchListTile(
        title: Text('Bloquear'),
        value: _bloquear,
        onChanged: (checked) {
          setState(() {
            _bloquear = checked;
          });
        },
      );
}
