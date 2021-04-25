import 'package:flutter/material.dart';

import 'package:kc_app_project/src/routes/routes.dart';
import 'package:kc_app_project/src/pages/aplicaciones_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Knowledge Center',
      initialRoute: '/',
      routes: getAplicaciones(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => AplicacionesPage());
      },
    );
  }
}
