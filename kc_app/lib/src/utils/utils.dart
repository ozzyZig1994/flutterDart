import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    context: context, 
    builder: 
      (context) => AlertDialog(
        title: Text('Credenciales incorrectas'),
        content: Text(mensaje),
        actions: <Widget>[
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Ok'))
        ],
      )
    )
  ;
}
