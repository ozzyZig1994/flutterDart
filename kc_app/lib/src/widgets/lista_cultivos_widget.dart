import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:kc_app/src/models/cultivos_models.dart';

class ListaCultivos extends StatelessWidget {
  final List<Cultivo> cultivos;

  const ListaCultivos(this.cultivos);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: this.cultivos.length,
        itemBuilder: (BuildContext context, int index) =>
            _Cultivo(cultivo: this.cultivos[index], index: index))
    );
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
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: ScaleAnimation(
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: ListTile(
                leading: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: cultivo.icono
                ),
                title: Text(cultivo.nombre, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                dense: true,
                trailing: Icon(Icons.chevron_right, color: Colors.deepPurple),
                onTap: () => Navigator.pushNamed(context, 'cultivo', arguments: cultivo.nombre),
            )
          )
        )
      )
    );
  }
}
