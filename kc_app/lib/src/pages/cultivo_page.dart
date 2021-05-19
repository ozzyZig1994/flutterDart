import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:kc_app/src/providers/cultivo_provider.dart';

class CultivoPage extends StatefulWidget {
  static final String routeName = 'cultivo';

  @override
  _CultivoPageState createState() => _CultivoPageState();
}

class _CultivoPageState extends State<CultivoPage> {
  CultivoProvider info = new CultivoProvider();

  @override
  Widget build(BuildContext context) {
    final String cultivo = ModalRoute.of(context).settings.arguments;

    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text(cultivo),
              centerTitle: true,
              bottom: TabBar(tabs: [
                Tab(text: 'Aplicacion'),
                Tab(text: 'Etapas'),
                Tab(text: 'Informe')
              ]),
            ),
            body: _tabBarView(context, cultivo)));
  }

  TabBarView _tabBarView(BuildContext context, String cultivo) {
    return TabBarView(children: [
      InteractiveViewer(child: _aplicacion(context, cultivo)),
      InteractiveViewer(child: _etapa(context, cultivo)),
      _pdfViewer(context, cultivo)
    ]);
  }

  Widget _aplicacion(BuildContext context, String cultivo) {
    return FutureBuilder(
        future: info.getinfoCultivo(cultivo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return Center(
              child: FadeInImage(
                  placeholder: AssetImage('jar-loading.gif'),
                  image: NetworkImage(snapshot.data.aplicacion)),
            );
          else
            return Center(child: CircularProgressIndicator());
        });
  }

  Widget _etapa(BuildContext context, String cultivo) {
    return FutureBuilder(
        future: info.getinfoCultivo(cultivo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return Center(
              child: FadeInImage(
                  placeholder: AssetImage('jar-loading.gif'),
                  image: NetworkImage(snapshot.data.etapa)),
            );
          else
            return Center(child: CircularProgressIndicator());
        });
  }

  Widget _pdfViewer(BuildContext context, String cultivo) {
    return FutureBuilder(
        future: info.getinfoCultivo(cultivo),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.done) if (snapshot.data.informe != null)
            return Scaffold(
              body: PDF(
                      autoSpacing: true,
                      enableSwipe: true,
                      swipeHorizontal: false)
                  .cachedFromUrl(
                snapshot.data.informe,
                placeholder: (progress) => Center(child: Text('$progress %')),
                errorWidget: (error) => Center(child: Text(error.toString())),
              ),
            );
          else
            return Center(child: Icon(Icons.cloud_off));
          else
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
        });
  }
}
