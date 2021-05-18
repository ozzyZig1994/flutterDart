import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:kc_app/src/providers/cultivo_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CultivoPage extends StatelessWidget {
  static final String routeName = 'cultivo';

  @override
  Widget build(BuildContext context) {
    final String cultivo = ModalRoute.of(context).settings.arguments;
    
    CultivoProvider info = new CultivoProvider();
    return Scaffold(
      body: FutureBuilder(
          future: info.getinfoCultivo(cultivo),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(cultivo),
                  centerTitle: true,
                ),
                body: PDF(autoSpacing: true, enableSwipe: true, swipeHorizontal: true).cachedFromUrl(
                  snapshot.data.informe,
                  placeholder: (progress) => Center(child: Text('$progress %')),
                  errorWidget: (error) => Center(child: Text(error.toString())),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text(cultivo),
                  centerTitle: true,
                ),
                body: Center(child: CircularProgressIndicator()),
              );
            }
          }),
    );
  }

  Widget _contenido(AsyncSnapshot snapshot) {
    final data = snapshot.data;
    return Center(
      child: ListView(
        children: [
          Container(
            child: InteractiveViewer(
              child: FadeInImage(
                placeholder: AssetImage('cloud.gif'), 
                image: NetworkImage(data.etapa)
              )
            ),
          ),
          Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage, 
              image: data.aplicacion
            ),
          ),
        ],
      ),
    );
  }
}
