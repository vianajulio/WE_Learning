import 'dart:convert';
import 'package:we_learning_android/entities/aula.dart';
import 'package:http/http.dart' as http;

class ClassApi {
  static final ClassApi instance = ClassApi._();
  ClassApi._();

  Future<bool> cadastrarAula(Aula aula) async {
    try {
      Map<String, dynamic> encodeString = {
        "id": 0,
        "title": aula.titulo,
        "description": aula.descricao,
        "video_url": aula.url,
        "data": "1977-01-01",
        "": aula.pierSitReg,
      };

      var encode = json.encode(encodeString);

      var url =
          Uri.http('apiwelearn.azurewebsites.net', 'api/usuario/cadastrar');

      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'}, body: encode);

      if (response.statusCode != 200) {
        return false;
      }

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
