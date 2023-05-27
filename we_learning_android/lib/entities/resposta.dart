class Resposta {
  int? id;
  String? usuario;
  String? conteudoResposta;
  String? data;
  String? pierSitReg;

  Resposta({
    this.id,
    this.usuario,
    this.conteudoResposta,
    this.data,
    this.pierSitReg,
  });

  factory Resposta.fromJson(Map<String, dynamic> json){
    return Resposta(
      id: json['id'],
      usuario: json['nome_usuario'],
      conteudoResposta: json['conteudo_resposta'],
      data: json['data_resposta'],
      pierSitReg: json['pier_sit_reg']
    );
  }

  List<Resposta> listFromJson(List<Map<String, dynamic>> json){
    var lista = List<Resposta>.from(json.map((json) => Resposta.fromJson(json)));
    return lista;
  }

}
