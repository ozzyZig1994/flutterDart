import 'package:flutter/material.dart';

import 'package:flutter_application_1/src/pages/home_page.dart';

class MyApp extends StatelessWidget { // Definicion de widget sin estado

  @override
  Widget build(BuildContext context) { // Sobrescribiendo el metodo build del StatelessWidget
    return MaterialApp (
      home: Center (
        child: HomePage(),
      ),
    ); // Widget de configuracion global de la app
  }
  
}