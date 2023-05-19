class Topico {
  int? id;
  String? assuntoTopico;
  String? nomeCategoria;
  String? nomeUsuario;
  int? idaulatopico;
  String? dataTopico;
  String? pierSitReg;

  Topico({
    this.id,
    this.assuntoTopico,
    this.nomeCategoria,
    this.nomeUsuario,
    this.idaulatopico,
    this.dataTopico,
    this.pierSitReg
  });

  Topico.app({
    this.id,
    this.assuntoTopico,
    this.nomeCategoria,
    this.nomeUsuario,
    this.dataTopico,
    this.pierSitReg,
  });

   factory Topico.fromJson(Map<String, dynamic> json) {
    return Topico.app(
      id: json['id'],
      assuntoTopico: json['assunto'],
      nomeCategoria: json['categoria'],
      nomeUsuario: json['nome_Usuario'],
      dataTopico: json['data'],
      pierSitReg: json['pierSitReg'],
    );
  }

  List<Topico> listFromJson(List<Map<String, dynamic>> json){
    var lista = List<Topico>.from(json.map((json) => Topico.fromJson(json)));
    return lista;
  }

  
  
  
  
  
  
}
