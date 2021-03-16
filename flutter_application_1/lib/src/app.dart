import 'package:flutter/material.dart';

//import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/contador_page.dart';

class MyApp extends StatelessWidget { // Definicion de widget sin estado

  @override
  Widget build(BuildContext context) { // Sobrescribiendo el metodo build del StatelessWidget
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: Center (
        //child: HomePage(),
        child: ContadorPage ()
      ),
    ); // Widget de configuracion global de la app
  }
  
}