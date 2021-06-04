import 'package:flutter/material.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

void mostrarAlerta(BuildContext context, String mensaje) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    borderSide: BorderSide(color: Colors.green, width: 2),
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.SCALE,
    title: 'ERROR',
    desc: mensaje,
    showCloseIcon: true,
  )..show();
}

void mostrarLoader(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('cloud.gif'),
            ],
          ),
        );
      });
}

void ocultarLoader(BuildContext context) {
  Navigator.pop(context);
}
