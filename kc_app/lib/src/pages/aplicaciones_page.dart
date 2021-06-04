import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:kc_app/src/widgets/menu_widget.dart';
import 'package:kc_app/src/services/cultivos_service.dart';
import 'package:kc_app/src/widgets/lista_cultivos_widget.dart';
import 'package:kc_app/src/widgets/search_delegate.dart';
import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';

class AplicacionesPage extends StatefulWidget {
  static final String routeName = 'home';
  @override
  _AplicacionesPageState createState() => _AplicacionesPageState();
}

class _AplicacionesPageState extends State<AplicacionesPage>
    with AutomaticKeepAliveClientMixin {
      
  final prefs = new PreferenciasUsuario();
  
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    prefs.ultimaPagina = AplicacionesPage.routeName;
    final cultivos = Provider.of<CultivosService>(context).cultivos;
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicaciones'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      drawer: MenuWidget(),
      body: (cultivos.length == 0)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListaCultivos(cultivos),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
