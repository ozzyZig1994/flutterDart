import 'package:flutter/material.dart';

import 'package:kc_app/src/providers/cultivos_provider.dart';

class DataSearch extends SearchDelegate {
  final cultivoProvider = new CultivosProvider();
  @override
  String get searchFieldLabel => 'Buscar cultivo';

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones del AppBar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder que crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen cuando la persona escribe
    if (query.isEmpty) return Container();

    return FutureBuilder(
        future: cultivoProvider.buscaCultivo(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if ((snapshot.connectionState == ConnectionState.done) &
              snapshot.hasData) {
            final cultivo = snapshot.data;
            return ListView.builder(
                itemCount: cultivo['info'].length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(cultivo['info'][index]['cultivo']),
                    onTap: () {
                      close(context, null);
                      Navigator.pushNamed(context, 'cultivo',
                          arguments: <String, String>{
                            'nombre': cultivo['info'][index]['cultivo'],
                            'etapa': cultivo['info'][index]['etapa'],
                            'aplicacion': cultivo['info'][index]['aplicacion'],
                            'informe': cultivo['info'][index]['informe']
                          });
                    },
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
