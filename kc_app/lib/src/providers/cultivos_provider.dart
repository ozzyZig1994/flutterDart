import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';

class CultivosProvider {
  final _prefs = new PreferenciasUsuario();

  final _url = 'www.bactiva.com';

  Future<Map<String, dynamic>> buscaCultivo(String query) async {
    final cultivoResponse = await http.get(
        Uri.https(_url,
            '/knowledgecenter/kc/public/cultivos/buscaCultivo/cultivo/$query/idioma/es'),
        headers: {'token': _prefs.token});

    Map<String, dynamic> decodeCultivoResp = json.decode(cultivoResponse.body);

    return decodeCultivoResp;
  }
}
