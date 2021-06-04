import 'package:flutter/material.dart';
import 'package:kc_app/src/pages/cultivo_page.dart';
import 'package:kc_app/src/pages/galeria_page.dart';
import 'package:kc_app/src/pages/pdf_view_page.dart';

import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:kc_app/src/providers/provider.dart';
import 'package:kc_app/src/pages/home_page.dart';
import 'package:kc_app/src/pages/login_page.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Knowledge Center',
        initialRoute: prefs.ultimaPagina,
        routes: {
          LoginPage.routeName: (BuildContext context) => LoginPage(),
          HomePage.routeName: (BuildContext context) => HomePage(),
          CultivoPage.routeName : (BuildContext context) => CultivoPage(),
          PdfViewPage.routeName : (BuildContext context) => PdfViewPage(),
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
