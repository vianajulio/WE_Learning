import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../entities/topico.dart';

class TopicoApi {
  static final TopicoApi instance = TopicoApi._();
  TopicoApi._();

  Future<List<Topico>?> getAll() async {
    try {
      List<Topico> topicos;
      var url = Uri.https(apiIp, '/api/topico/listar');

      //conexão com a api
      var response = await http.get(url).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );

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
      var url = Uri.https(apiIp, '/api/topico/buscar/$nomeCategoria');

      var response = await http.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );

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

  Future<bool> cadastroTopico(
      String titulo, String descricao, int idCategoria, int idUsuario) async {
    try {
      Map<String, dynamic> encodeString = {
        "titulo_topico": titulo,
        "assunto": descricao,
        "categoria": idCategoria.toString(),
        "nome_usuario": idUsuario.toString(),
        "pier_sit_reg": "ATV"
      };

      var encode = json.encode(encodeString);

      var url = Uri.https(apiIp, '/api/topico/cadastrar');

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
