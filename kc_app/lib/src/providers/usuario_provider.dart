import 'package:http/http.dart' as http;

class UsuarioProvider {
  Future login(String email, String password) async {
    final response =
        await http.get(Uri.parse('https://api.ipify.org?format=json'));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.bodyBytes}');

    return {};
  }
}
