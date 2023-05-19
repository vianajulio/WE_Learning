import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:we_learning_android/entities/topicoapp.dart';

class TopicoApi {
  static final TopicoApi instance = TopicoApi._();
  TopicoApi._();

  Future<List<TopicoApp>?> getAll() async {
      List<TopicoApp> topicos;
      TopicoApp app = TopicoApp();
    try {
      var url = Uri.http('apiwelearn.azurewebsites.net', '/api/topico/listar');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        return null;
      } else {
        var listTopics =
            json.decode(response.body).cast<Map<String, dynamic>>();
            topicos = app.listFromJson(listTopics);
            print(topicos);
        return topicos;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
