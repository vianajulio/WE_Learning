import 'package:we_learning_android/entities/usuario.dart';

class Resposta {
  int? id;
  String? usuario;
  String? assunto_topico;
  String? data;
  String? pierSitReg;

  Resposta({
    this.id,
    this.usuario,
    this.assunto_topico,
    this.data,
    this.pierSitReg,
  });

  factory Resposta.fromJson(Map<String, dynamic> json){
    return Resposta(
      id: json['id'],
      usuario: json['nome_usuario'],
      assunto_topico: json['assunto_topico'],
      data: json['data_resposta'],
      pierSitReg: json['pier_sit_reg']
    );
  }

  List<Resposta> listFromJson(List<Map<String, dynamic>> json){
    var lista = List<Resposta>.from(json.map((json) => Resposta.fromJson(json)));
    return lista;
  }



}
