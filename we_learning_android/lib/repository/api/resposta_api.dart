import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../entities/resposta.dart';

class RespostaApi {
  static final RespostaApi instance = RespostaApi._();
  RespostaApi._();

  Future<List<Resposta>?> getAll(int tag) async {
    try {
      List<Resposta> respostas;

      var url = Uri.https(apiIp, '/api/respostas/listar/$tag');

      var response = await http.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );

      if (response.statusCode != 200) {
        return null;
      }

      var listRespostas =
          json.decode(response.body).cast<Map<String, dynamic>>();
      respostas = Resposta().listFromJson(listRespostas);
      return respostas;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> post(
      String idUsuario, String conteudoResposta, int idTopico) async {
    try {
      Map<String, dynamic> encodeString = <String, dynamic>{
        "id_topico": idTopico,
        "pier_sit_reg": "ATV",
        "nome_usuario": idUsuario,
        "conteudo_resposta": conteudoResposta,
      };

      var encode = jsonEncode(encodeString);

      var url = Uri.https(apiIp, '/api/respostas/cadastrar');

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: encode,
      );

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
