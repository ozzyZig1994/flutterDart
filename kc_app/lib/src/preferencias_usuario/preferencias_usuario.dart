import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del token de sesion
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token( String value ) {
    _prefs.setString('token', value);
  }

  // GET y SET del id de usuario
  get idUsuario {
    return _prefs.getInt('idUsuario') ?? '';
  }

  set idUsuario( int value ) {
    _prefs.setInt('idUsuario', value);
  }

  // GET y SET del usuario
  get usuario {
    return _prefs.getString('usuario') ?? '';
  }

  set usuario( String value ) {
    _prefs.setString('usuario', value);
  }

  // GET y SET del nombre de usuario
  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario( String value ) {
    _prefs.setString('nombreUsuario', value);
  }
  
  // GET y SET del email de usuario
  get emailUsuario {
    return _prefs.getString('emailUsuario') ?? '';
  }

  set emailUsuario( String value ) {
    _prefs.setString('emailUsuario', value);
  }

  // GET y SET del rol de usuario
  get rolUsuario {
    return _prefs.getString('rolUsuario') ?? '';
  }

  set rolUsuario( String value ) {
    _prefs.setString('rolUsuario', value);
  }

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina( String value ) {
    _prefs.setString('ultimaPagina', value);
  }

}