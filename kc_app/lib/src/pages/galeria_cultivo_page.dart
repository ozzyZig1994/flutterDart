import 'package:flutter/material.dart';

class GaleriaCultivoPage extends StatelessWidget {
  static final String routeName = 'galeria_cultivo';

  @override
  Widget build(BuildContext context) {
    final cultivo = ModalRoute.of(context).settings.arguments;
    print(cultivo);
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria de $cultivo'),
        centerTitle: true,
      ),
    );
  }
}
