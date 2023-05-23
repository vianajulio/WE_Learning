import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:we_learning_android/entities/topico.dart';

class TopicoApi {
  static final TopicoApi instance = TopicoApi._();
  TopicoApi._();

  Future<List<Topico>?> getAll() async {
    List<Topico> topicos;
    try {
      var url = Uri.http('apiwelearn.azurewebsites.net', '/api/topico/listar');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        return null;
      } else {
        var listTopics =
            json.decode(response.body).cast<Map<String, dynamic>>();
        topicos = Topico().listFromJson(listTopics);
        return topicos;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Topico>?> getSelectedTopics(String nomeCategoria) async {
    List<Topico> topico;
    try {
      var url = Uri.http('apiwelearn.azurewebsites.net',
          '/api/topico/buscar/$nomeCategoria');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        return null;
      } else {
        var topicoJson =
            json.decode(response.body).cast<Map<String, dynamic>>();
        topico = Topico().listFromJson(topicoJson);
        return topico;
      }
    } catch (e) {
      rethrow;
    }
  }
}
