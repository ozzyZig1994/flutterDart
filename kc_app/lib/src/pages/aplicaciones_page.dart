import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:kc_app/src/widgets/menu_widget.dart';
import 'package:kc_app/src/services/cultivos_service.dart';
import 'package:kc_app/src/widgets/lista_cultivos_widget.dart';

class AplicacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cultivos = Provider.of<CultivosService>(context).cultivos;
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicaciones'),
        elevation: 15.0,
        centerTitle: true,
      ),
      drawer: MenuWidget(),
      body: (cultivos.length == 0)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListaCultivos(cultivos),
    );
  }
}
