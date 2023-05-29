import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:we_learning_android/entities/topico.dart';

class TopicoApi {
  static final TopicoApi instance = TopicoApi._();
  TopicoApi._();

  Future<List<Topico>?> getAll() async {
    try {
      List<Topico> topicos;
      var url = Uri.http('apiwelearn.azurewebsites.net', '/api/topico/listar');

      //conexão com a api
      var response = await http.get(url);

      if (response.statusCode != 200) {
        return null;
      } else {
        var listTopics =
            json.decode(response.body).cast<Map<String, dynamic>>();
        topicos = Topico.listFromJson(listTopics);
        return topicos;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Topico>?> getSelectedTopics(String nomeCategoria) async {
    List<Topico> topico;
    try {
      var url = Uri.http(
          'apiwelearn.azurewebsites.net', '/api/topico/buscar/$nomeCategoria');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        return null;
      } else {
        var topicoJson =
            json.decode(response.body).cast<Map<String, dynamic>>();
        topico = Topico.listFromJson(topicoJson);
        return topico;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> cadastroTopico(Topico topico) async {
    try {
      var encodeString =topico.toJson();
      var encode = json.encode(encodeString);

      var url =
          Uri.http('apiwelearn.azurewebsites.net', '/api/topico/cadastrar');

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: encode,
      );

      if (response.statusCode != 200) {
        return false;
      }

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
