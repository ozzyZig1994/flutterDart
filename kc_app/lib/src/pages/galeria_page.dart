import 'package:flutter/material.dart';

import 'package:kc_app/src/widgets/menu_widget.dart';
import 'package:kc_app/src/widgets/tarjeta_widget.dart';
import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';

class GaleriaPage extends StatelessWidget {
  static final String routeName = 'galeria';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = GaleriaPage.routeName;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Galeria'),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(text: 'Laboratorio'),
              Tab(text: 'Aplicaciones'),
              Tab(text: 'Interno')
            ]),
          ),
          drawer: MenuWidget(),
          body: _tabBarView(context),
        ));
  }

  TabBarView _tabBarView(BuildContext context) {
    return TabBarView(children: <Widget>[
      _laboratorio(context),
      _aplicaciones(context),
      _interno(context)
    ]);
  }

  Widget _aplicaciones(BuildContext context) {
    return ListView(children: <Widget>[
      Tarjeta('Aplicaciones.jpg', 'Aspersión'),
      SizedBox(height: 20.0),
      Tarjeta('Aplicaciones.jpg', 'Campo'),
      SizedBox(height: 20.0),
      Tarjeta('Aplicaciones.jpg', 'Charola'),
      SizedBox(height: 20.0),
      Tarjeta('Aplicaciones.jpg', 'Sistema de riego'),
    ], scrollDirection: Axis.vertical, padding: EdgeInsets.all(10.0));
  }

  Widget _laboratorio(BuildContext context) {
    return ListView(children: <Widget>[
      Tarjeta('Laboratorio.jpg', 'Microorganismos'),
      SizedBox(height: 20.0),
      Tarjeta('Laboratorio.jpg', 'Instalaciones'),
      SizedBox(height: 20.0),
      Tarjeta('Laboratorio.jpg', 'Insectos'),
      SizedBox(height: 20.0)
    ], scrollDirection: Axis.vertical, padding: EdgeInsets.all(10.0));
  }

  Widget _interno(BuildContext context) {
    return ListView(children: <Widget>[
      Tarjeta('Interno.jpg', 'Eventos'),
      SizedBox(height: 20.0),
      Tarjeta('Interno.jpg', 'Personal'),
      SizedBox(height: 20.0)
    ], scrollDirection: Axis.vertical, padding: EdgeInsets.all(10.0));
  }
}
