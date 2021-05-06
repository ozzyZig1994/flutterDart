import 'package:flutter/material.dart';

import 'package:kc_app/src/widgets/menu_widget.dart';

class GaleriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria'),
        elevation: 15.0,
        centerTitle: true,
      ),
      drawer: MenuWidget(),
    );
  }
}
