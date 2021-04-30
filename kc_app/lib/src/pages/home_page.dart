import 'package:flutter/material.dart';

import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:kc_app/src/pages/login_page.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    // Va ir escalando hasta encontrar una instacia del Provider
    // dentro del árbol de Widgets
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: _crearMenu(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Usuario: ${prefs.nombreUsuario}'),
          Divider(),
          Text('Bienvenido')
        ],
      ),
    );
  }

  Drawer _crearMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('menu-img.jpg'), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.deepPurple),
            title: Text('Cerrar sesión'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, LoginPage.routeName),
          )
        ],
      ),
    );
  }
}
