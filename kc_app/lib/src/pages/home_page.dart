import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:kc_app/src/providers/usuario_provider.dart';
import 'package:kc_app/src/pages/login_page.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    // Va ir escalando hasta encontrar una instacia del Provider
    // dentro del árbol de Widgets
    prefs.ultimaPagina = HomePage.routeName;

    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Knowledge Center'),
        ),
        drawer: _crearMenu(context),
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
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

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.deepOrangeAccent,
        ),
        Container(
          color: Colors.deepPurpleAccent,
        )
      ],
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        onTap: (i) => print('$i'),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Aplicaciones'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), label: 'Galeria'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Academia'),
        ]);
  }
}

class _NavegacionModel with ChangeNotifier{
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    notifyListeners ();
  }
}
