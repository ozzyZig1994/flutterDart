import 'package:flutter/material.dart';
import 'package:kc_app/src/models/cultivos_models.dart';

class ListaCultivos extends StatelessWidget {
  final List<Cultivo> cultivos;

  const ListaCultivos(this.cultivos);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.cultivos.length,
        itemBuilder: (BuildContext context, int index) =>
            _Cultivo(cultivo: this.cultivos[index], index: index));
  }
}

class _Cultivo extends StatelessWidget {
  final Cultivo cultivo;
  final int index;

  const _Cultivo({@required this.cultivo, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_TarjetaCultivo(cultivo, index)],
      ),
    );
  }
}

class _TarjetaCultivo extends StatelessWidget {
  final Cultivo cultivo;
  final int index;

  const _TarjetaCultivo(this.cultivo, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.network(cultivo.icono),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    cultivo.nombre,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
