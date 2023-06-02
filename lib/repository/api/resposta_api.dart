import 'dart:convert';

import 'package:we_learning_android/entities/resposta.dart';
import 'package:http/http.dart' as http;

class RespostaApi {
  static final RespostaApi instance = RespostaApi._();
  RespostaApi._();

  Future<List<Resposta>?> getAll(int tag) async {
    try {
      List<Resposta> respostas;

      var url =
          Uri.https('apiwelearn.azurewebsites.net', '/api/respostas/listar/$tag');

      var response = await http.get(url);

      if (response.statusCode != 200) {}

      var listRespostas =
          json.decode(response.body).cast<Map<String, dynamic>>();
      respostas = Resposta().listFromJson(listRespostas);
      return respostas;
    } catch (e) {
      rethrow;
    }
  }
}
