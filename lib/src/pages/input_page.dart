import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _crearInput(context),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput(context) => TextField(
        onChanged: (valor) {
          _nombre = valor;
          setState(() {});
        },
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Pepito Perez',
          labelText: 'Nombre',
          helperText: 'Ponga aquí su nombre completo',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
        ),
      );

  Widget _crearPersona() => ListTile(
        title: Text(_nombre),
        leading: Text(_email),
      );

  _crearEmail() => TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (valor) {
          _email = valor;
          setState(() {});
        },
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          counterText: 'Letras ${_email.length}',
          hintText: 'pepito@perez.com',
          labelText: 'E-mail',
          helperText: 'Ingrese su correo electrónico',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
        ),
      );

  _crearPassword() => TextField(
        obscureText: true,
        onChanged: (valor) {
          _email = valor;
          setState(() {});
        },
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          counterText: 'Letras ${_password.length}',
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock_open),
        ),
      );

  _crearFecha(context) => TextField(
        enableInteractiveSelection: false,
        onChanged: (valor) {
          _email = valor;
          setState(() {});
        },
        onTap: () => _selectDate(context),
        controller: _inputFieldDateController,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          counterText: 'Letras ${_password.length}',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today_outlined),
        ),
      );

  _selectDate(context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
      locale: Locale('es', 'CO'),
    );

    if (picked != null) {
      setState(() {
        _inputFieldDateController.text = picked.toString();
      });
    }
  }
}
