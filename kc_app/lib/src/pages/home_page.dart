import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cron/cron.dart';

import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:kc_app/src/pages/aplicaciones_page.dart';
import 'package:kc_app/src/pages/galeria_page.dart';
import 'package:kc_app/src/services/cultivos_service.dart';
import 'package:kc_app/src/providers/usuario_provider.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();
  final cron = new Cron();
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    // Va ir escalando hasta encontrar una instacia del Provider
    // dentro del árbol de Widgets
    prefs.ultimaPagina = HomePage.routeName;
    cron.schedule(Schedule.parse('0 * * * *'), () async {
      usuarioProvider.logout(prefs.usuario, prefs.ip);
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    });

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new _NavegacionModel()),
        ChangeNotifierProvider(create: (_) => new CultivosService()),
      ],
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        AplicacionesPage(),
        GaleriaPage(),
        //Container(color: Colors.deepPurple)
      ],
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.science), label: 'Aplicaciones'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), label: 'Galeria'),
          //BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Academia'),
        ]);
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 320), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
