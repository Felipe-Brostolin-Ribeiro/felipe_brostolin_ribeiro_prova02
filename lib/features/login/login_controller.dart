import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:worldskills/core/aluno/aluno.dart';

import '../../core/enviroments/enviroments.dart';
import '../../core/local_storage/store.dart';
import 'login.dart';

class LoginController {
  static Future<Aluno?> login(String email, String senha) async {
    final Login login = Login(email: email, senha: senha);

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        body: jsonEncode(login.toJson()),
        headers: baseHeaders,
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        final store = Store();
        store.save('usuario', json);
        return Aluno.fromJson(json);
      }
    }

    catch (e) {
      print(e);
    }
    return null;
  }
}
