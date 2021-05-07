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

    if (decodeUsuarioResp.containsKey('token')) {
      _prefs.ip = decodeIpResp['ip'];
      _prefs.token = decodeUsuarioResp['token'];
      _prefs.idUsuario = decodeUsuarioResp['usuario']['id'];
      _prefs.nombreUsuario = decodeUsuarioResp['usuario']['nombre'];
      _prefs.usuario = decodeUsuarioResp['usuario']['usuario'];
      _prefs.emailUsuario = decodeUsuarioResp['usuario']['email'];
      _prefs.rolUsuario = decodeUsuarioResp['usuario']['rol'];
      return decodeUsuarioResp;
    } else
      return decodeUsuarioResp;
  }

  Future<Map<String, dynamic>> logout(String email, String ip) async {
    final sessionData = {'usuario': email, 'ip': ip};

    final logoutResponse = await http.post(
        Uri.parse(
            'https://www.bactiva.com/knowledgecenter/kc/public/usuarios/logout'),
        body: sessionData);
    Map<String, dynamic> decodeLogoutResponse =
        json.decode(logoutResponse.body);
    
    return decodeLogoutResponse;
  }
}
