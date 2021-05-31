import 'dart:ui';

import 'package:flutter/material.dart';

class Tarjeta extends StatelessWidget {
  final String titulo;
  final String fondo;

  const Tarjeta(this.fondo, this.titulo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 333.6,
      height: 218.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.6),
          image: DecorationImage(
              image: AssetImage(this.fondo), fit: BoxFit.cover)),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 19.2,
              left: 19.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.8),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 19.2, sigmaX: 19.2),
                  child: Container(
                    height: 36.0,
                    padding: EdgeInsets.only(left: 16.72, right: 14.4),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Text(
                          this.titulo,
                          style: TextStyle(fontSize: 20.8, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
