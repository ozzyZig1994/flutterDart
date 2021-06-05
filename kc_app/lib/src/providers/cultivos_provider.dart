import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';

class CultivosProvider {
  final _prefs = new PreferenciasUsuario();
  
  Future<Map<String, dynamic>> buscaCultivo(String query) async {
    final cultivoResponse = await http.get(Uri.parse(
        'https://www.bactiva.com/knowledgecenter/kc/public/cultivos/buscaCultivo/cultivo/$query/idioma/es'),
        headers: {'token': _prefs.token});

    Map<String, dynamic> decodeCultivoResp =  json.decode(cultivoResponse.body);

    return decodeCultivoResp;
  }
}
