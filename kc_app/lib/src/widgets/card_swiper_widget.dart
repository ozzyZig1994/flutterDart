import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kc_app/src/providers/galeria_provider.dart';

class CardSwiper extends StatelessWidget {
  final String cultivo;
  final galeriaProvider = new GaleriaProvider();

  CardSwiper({@required this.cultivo});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: galeriaProvider.buscaCultivo(cultivo),
      builder: (context, snapshot) {
        if ((snapshot.connectionState == ConnectionState.done) &
            snapshot.hasData) {
          if (snapshot.data['galeria'] != null) {
            if (snapshot.data['galeria'].length > 1)
              return _swiper(context, snapshot);
            else
              return _unaSolaImagen(context, snapshot);
          } else
            return _alerta(snapshot);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _swiper(BuildContext context, AsyncSnapshot snapshot) {
    final _screenSize = MediaQuery.of(context).size;
    final galeria = snapshot.data;
    int numFotos = galeria['galeria'].length;

    return Container(
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  placeholder: AssetImage('no-image.jpg'),
                  image: NetworkImage(galeria['galeria'][index]['ruta']),
                  fit: BoxFit.fill,
                ));
          },
          itemCount: numFotos,
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.9,
          itemHeight: _screenSize.height * 0.6),
    );
  }

  Widget _alerta(AsyncSnapshot snapshot) {
    return Center(child: Text(snapshot.data['message']));
  }

  Widget _unaSolaImagen(BuildContext context, AsyncSnapshot snapshot) {
    final _screenSize = MediaQuery.of(context).size;
    final galeria = snapshot.data;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FadeInImage(
          width: _screenSize.width * 0.9,
          height: _screenSize.height * 0.6,
          placeholder: AssetImage('no-image.jpg'),
          image: NetworkImage(galeria['galeria'][0]['ruta']),
          fit: BoxFit.fill,
        ));
  }
}
