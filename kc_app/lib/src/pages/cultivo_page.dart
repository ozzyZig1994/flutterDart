import 'package:flutter/material.dart';

class CultivoPage extends StatelessWidget {
  static final String routeName = 'cultivo';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> cultivo =
        ModalRoute.of(context).settings.arguments;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(cultivo['nombre']),
            centerTitle: true,
            bottom:
                TabBar(tabs: [Tab(text: 'Aplicacion'), Tab(text: 'Etapas')]),
          ),
          body: _tabBarView(context, cultivo['etapa'], cultivo['aplicacion']),
          floatingActionButton: (cultivo['informe'] !=  null) ? _pdfView(context, cultivo['informe']) : null,
        ));
  }

  TabBarView _tabBarView(BuildContext context, String etapa, String aplicacion) {
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
            onPressed: () => Navigator.pushNamed(context, 'pdf_view', arguments: informe),
            child: Icon(Icons.picture_as_pdf),
          );
  }
}
