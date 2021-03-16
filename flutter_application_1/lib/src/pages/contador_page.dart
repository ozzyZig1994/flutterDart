import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final _estiloTexto = new TextStyle(fontSize: 25.0);

  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateFul'),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Numero de tabs: ', style: _estiloTexto),
            Text('$_conteo', style: _estiloTexto)
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: _crearBotones (),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _crearBotones () {
    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded (
          child: FloatingActionButton( child: Icon(Icons.exposure_minus_1), onPressed: _minus1),
        ),
        Expanded (
          child: FloatingActionButton( child: Icon(Icons.exposure_zero), onPressed: _reset),
        ),
        Expanded (
          child: FloatingActionButton( child: Icon(Icons.exposure_plus_1), onPressed: _plus1),
        )
      ],
    );
  }

  void _plus1 () {
    setState(() => _conteo++);
  }

  void _minus1 () {
    setState(() => _conteo--);
  }

  void _reset () {
    setState(() => _conteo = 0);
  }
}
