import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final String cultivo;

  CardSwiper({@required this.cultivo});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  "https://via.placeholder.com/350x150",
                  fit: BoxFit.fill,
                ));
          },
          itemCount: 3,
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.9,
          itemHeight: _screenSize.height * 0.6),
    );
  }
}
