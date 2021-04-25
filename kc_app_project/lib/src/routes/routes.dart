import 'package:flutter/material.dart';

//import 'package:kc_app_project/src/pages/academia_page.dart';
import 'package:kc_app_project/src/pages/aplicaciones_page.dart';
//import 'package:kc_app_project/src/pages/galeria_page.dart';

Map<String, WidgetBuilder> getAplicaciones() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => AplicacionesPage (),
    'busqueda_aplicaciones': (BuildContext context) => AplicacionesPage (),
    //'galeria': (BuildContext context) => GaleriaPage (),
    //'academia': (BuildContext context) => AcademiaPage ()
  };
}
