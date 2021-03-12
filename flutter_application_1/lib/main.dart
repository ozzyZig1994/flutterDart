import 'package:flutter/material.dart'; // Para que pueda encontrar la clase de mi widget y lo pueda reconocer

void main () {
  runApp (new MyApp ()); // Inicializando widget
}

class MyApp extends StatelessWidget { // Definicion de widget sin estado

  @override
  Widget build(BuildContext context) { // Sobrescribiendo el metodo build del StatelessWidget
    return MaterialApp (
      home: Center (
        child: Text ('Hola Mundo'),
      ),
    ); // Widget de configuracion global de la app
  }
  
}