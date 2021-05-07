import 'package:flutter/material.dart';

class CultivoPage extends StatelessWidget {
  final String cultivo;

  CultivoPage(this.cultivo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cultivo),
        centerTitle: true,
      ),
    );
  }
}
