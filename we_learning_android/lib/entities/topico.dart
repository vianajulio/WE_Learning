class Topico {
  int? id;
  String? tituloTopico;
  String? assuntoTopico;
  String? nomeCategoria;
  String? nomeUsuario;
  int? idAulaTopico;
  String? dataTopico;
  String? pierSitReg;

  Topico({
    this.id,
    this.tituloTopico,
    this.assuntoTopico,
    this.nomeCategoria,
    this.nomeUsuario,
    this.idAulaTopico,
    this.dataTopico,
    this.pierSitReg
  });

   factory Topico.fromJson(Map<String, dynamic> json) {
    return Topico(
      id: json['id'],
      tituloTopico: json['titulo_Topico'],
      assuntoTopico: json['assunto'],
      nomeCategoria: json['categoria'],
      nomeUsuario: json['nome_Usuario'],
      idAulaTopico: json['id_Aula'],
      dataTopico: json['data'],
      pierSitReg: json['pier_sit_reg'],
    );
  }

  List<Topico> listFromJson(List<Map<String, dynamic>> json){
    var lista = List<Topico>.from(json.map((json) => Topico.fromJson(json)));
    return lista;
  }

  
  
  
  
  
  
}
