import 'package:flutter/material.dart';

import 'package:kc_app/src/widgets/card_swiper_widget.dart';

class GaleriaCultivoPage extends StatelessWidget {
  static final String routeName = 'galeria_cultivo';

  @override
  Widget build(BuildContext context) {
    final String cultivo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria de $cultivo'),
        centerTitle: true,
      ),
      body: Center(
        child: _swiperTarjetas(),
      ),
    );
  }

  Widget _swiperTarjetas() {
    return CardSwiper();
  }
}
