import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:we_learning_android/entities/topico.dart';

class TopicoApi {
  static final TopicoApi instance = TopicoApi._();
  TopicoApi._();

  Future<List<Topico>?> getAll() async {
      List<Topico> topicos;
      Topico app = Topico();
    try {
      var url = Uri.http('apiwelearn.azurewebsites.net', '/api/topico/listar');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        return null;
      } else {
        var listTopics =
            json.decode(response.body).cast<Map<String, dynamic>>();
            topicos = app.listFromJson(listTopics);
        return topicos;
      }
    } catch (e) {
      rethrow;
    }
  }
}
