import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kc_app/src/providers/galeria_provider.dart';

class CardSwiper extends StatelessWidget {
  final String cultivo;
  final galeriaProvider = new GaleriaProvider();

  CardSwiper({@required this.cultivo});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: galeriaProvider.buscaCultivo(cultivo),
      builder: (context, snapshot) {
        if ((snapshot.connectionState == ConnectionState.done) &
            snapshot.hasData) {
          final galeria = snapshot.data;
          return Container(
            child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        galeria['galeria'][index]['ruta'],
                        fit: BoxFit.fill,
                      ));
                },
                itemCount: galeria['galeria'].length,
                layout: SwiperLayout.STACK,
                itemWidth: _screenSize.width * 0.9,
                itemHeight: _screenSize.height * 0.6),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
