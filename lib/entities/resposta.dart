class Resposta {
  int? id;
  int? idTopico;
  String? usuario;
<<<<<<< HEAD:lib/entities/resposta.dart
  String? conteudoResposta;
=======
  String? assuntoResposta;
>>>>>>> origin/jaqui:we_learning_android/lib/entities/resposta.dart
  String? data;
  String? pierSitReg;

  Resposta({
    this.id,
    this.idTopico,
    this.usuario,
<<<<<<< HEAD:lib/entities/resposta.dart
    this.conteudoResposta,
=======
    this.assuntoResposta,
>>>>>>> origin/jaqui:we_learning_android/lib/entities/resposta.dart
    this.data,
    this.pierSitReg,
  });

  factory Resposta.fromJson(Map<String, dynamic> json){
    return Resposta(
      id: json['id'],
      idTopico: json['id_topico'],
      usuario: json['nome_usuario'],
<<<<<<< HEAD:lib/entities/resposta.dart
      conteudoResposta: json['conteudo_resposta'],
=======
      assuntoResposta: json['assunto_topico'],
>>>>>>> origin/jaqui:we_learning_android/lib/entities/resposta.dart
      data: json['data_resposta'],
      pierSitReg: json['pier_sit_reg']
    );
  }

  List<Resposta> listFromJson(List<Map<String, dynamic>> json){
    var lista = List<Resposta>.from(json.map((json) => Resposta.fromJson(json)));
    return lista;
  }

}
