import 'package:flutter/material.dart';

import 'package:kc_app/src/providers/cultivo_provider.dart';

class CultivoPage extends StatelessWidget {
  static final String routeName = 'cultivo';

  @override
  Widget build(BuildContext context) {
    final String cultivo = ModalRoute.of(context).settings.arguments;
    CultivoProvider info = new CultivoProvider();
    info.getinfoCultivo(cultivo);
    return Scaffold(
      appBar: AppBar(
        title: Text(cultivo),
        centerTitle: true,
      ),
      body: Center(child: Text(cultivo)),
    );
  }
}
