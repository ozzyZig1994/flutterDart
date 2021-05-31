import 'package:flutter/material.dart';

import 'package:kc_app/src/widgets/menu_widget.dart';

class GaleriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      Text('Laboratorio'),
      _aplicaciones(context),
      Text('Interno')
    ]);
  }

  Widget _aplicaciones(BuildContext context) {
    return ListView(children: <Widget>[
      Card(
        child: Container(
          height: 25.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Aplicaciones.jpg'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter)),
        ),
      )
    ], scrollDirection: Axis.vertical);
  }
}
