import 'package:flutter/material.dart';

import 'package:kc_app/src/widgets/lista_cultivos_widget.dart';

class CultivoPage extends StatelessWidget {
  static final String routeName = 'cultivo';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as CultivoArguments;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.nombre),
            actions: <Widget>[
              PopupMenuButton(
                  onSelected: (value) {
                    Navigator.pushNamed(context, 'galeria_cultivo',
                        arguments: args.nombre);
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            value: 'galeria',
                            child: Text('Ver galería de ${args.nombre}'))
                      ])
            ],
            centerTitle: true,
            bottom:
                TabBar(tabs: [Tab(text: 'Aplicacion'), Tab(text: 'Etapas')]),
          ),
          body: _tabBarView(context, args.etapa, args.aplicacion),
          floatingActionButton: (args.informe != '')
              ? _pdfView(context, args.informe)
              : null,
        ));
  }

  TabBarView _tabBarView(
      BuildContext context, String etapa, String aplicacion) {
    return TabBarView(children: <Widget>[
      InteractiveViewer(
          child: FadeInImage(
              placeholder: AssetImage('jar-loading.gif'),
              image: NetworkImage(etapa))),
      InteractiveViewer(
          child: FadeInImage(
              placeholder: AssetImage('jar-loading.gif'),
              image: NetworkImage(aplicacion)))
    ]);
  }

  FloatingActionButton _pdfView(BuildContext context, String informe) {
    return FloatingActionButton(
      onPressed: () =>
          Navigator.pushNamed(context, 'pdf_view', arguments: informe),
      child: Icon(Icons.picture_as_pdf),
    );
  }
}
