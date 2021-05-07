import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';

final _urlCultivo =
    'https://www.bactiva.com/knowledgecenter/kc/public/cultivos/infoCultivo';

class CultivoProvider {
  Future<Map<String, dynamic>> infoCultivo(String cultivo, String idioma) async {
    final _prefs = new PreferenciasUsuario();
    final cultivoResponse = await http.get(Uri.parse(_urlCultivo + '/cultivo/$cultivo/idioma/$idioma'), headers: {'token': _prefs.token});

    Map<String, dynamic> decodeCultivoResp = json.decode(cultivoResponse.body);

    return decodeCultivoResp;
  }
}
