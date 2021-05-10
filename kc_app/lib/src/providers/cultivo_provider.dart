import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:diacritic/diacritic.dart';

import 'package:kc_app/src/models/infoCultivo_model.dart';
import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';

class CultivoProvider {
  final _prefs = new PreferenciasUsuario();

  Future<Info> getinfoCultivo(String cultivo) async {
    cultivo = removeDiacritics(cultivo);
    final infoResponse = await http.get(
        Uri.parse(
            'https://www.bactiva.com/knowledgecenter/kc/public/cultivos/infoCultivo/cultivo/$cultivo/idioma/es'),
        headers: {'token': _prefs.token});

    final infoDecode = json.decode(infoResponse.body);
    final infoCultivo = new Info.fromJson(infoDecode['info']);

    print(infoCultivo.informe);

    return infoCultivo;
  }
}
