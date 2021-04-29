//import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:kc_app/src/preferencias_usuario/preferencias_usuario.dart';

class UsuarioProvider {
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final ipResponse =
        await http.get(Uri.parse('https://api.ipify.org?format=json'));
    Map<String, dynamic> decodeIpResp = json.decode(ipResponse.body);

    final authData = {
      'usuario': email,
      'contrasena': password,
      'ip': decodeIpResp['ip']
    };

    final usuarioResponse = await http.post(
        Uri.parse(
            'https://www.bactiva.com/knowledgecenter/kc/public/usuarios/login'),
        body: authData);
    Map<String, dynamic> decodeUsuarioResp = json.decode(usuarioResponse.body);

    print(decodeUsuarioResp);

    if (decodeUsuarioResp.containsKey('token')) {
      _prefs.token = decodeUsuarioResp['token'];
      return {
        'ok': decodeUsuarioResp['status'],
        'usuario': decodeUsuarioResp['usuario']
      };
    } else
      return {'ok': false, 'message': decodeUsuarioResp['message']};
  }
}
