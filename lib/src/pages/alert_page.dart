import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alertas')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: StadiumBorder(),
          ),
          onPressed: () {
            _mostrarAlerta(context);
          },
          child: Text('Mostrar alerta'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  _mostrarAlerta(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: Text('Alerta de muestra'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Text('Ojo con eso'), FlutterLogo(size: 100)],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Ok')),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancelar')),
              ],
            ));
  }
}
