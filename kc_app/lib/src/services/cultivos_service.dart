import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:kc_app/src/models/cultivos_models.dart';
import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';

class CultivosService with ChangeNotifier {
  List<Cultivo> cultivos = [];
  final _prefs = new PreferenciasUsuario();

  final String _url = 'www.bactiva.com';

  CultivosService() {
    this.getListaCultivos();
  }

  getListaCultivos() async {
    final respListCultivos = await http.get(
        Uri.https(_url, '/knowledgecenter/kc/public/cultivos/listaCultivos'),
        headers: {'token': _prefs.token});
    final cultivosResponse = cultivosFromJson(respListCultivos.body);

    this.cultivos.addAll(cultivosResponse.cultivos);
    notifyListeners();
  }
}
