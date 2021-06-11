import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';

class GaleriaProvider {
  final _prefs = new PreferenciasUsuario();

  final _url = 'www.bactiva.com';

  Future<Map<String, dynamic>> buscaCultivo(String query) async {
    final galeriaResponse = await http.get(
        Uri.https(_url,
            '/knowledgecenter/kc/public/cultivos/galeria/cultivo/$query/lang/es'),
        headers: {'token': _prefs.token});

    Map<String, dynamic> decodeGaleriaResp = json.decode(galeriaResponse.body);

    return decodeGaleriaResp;
  }
}
