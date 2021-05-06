import 'package:flutter/material.dart';

import 'package:kc_app/src/pages/login_page.dart';
import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:kc_app/src/providers/usuario_provider.dart';

class MenuWidget extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
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
            onTap: () => _onTap(context),
          )
        ],
      ),
    );
  }

  _onTap(BuildContext context) {
    usuarioProvider.logout(prefs.usuario, prefs.ip);
    return Navigator.pushReplacementNamed(context, LoginPage.routeName);
  }
}