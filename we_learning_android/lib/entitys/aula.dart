class Aula {
  int? id;
  String? titulo;
  String? descricao;
  String? thumbnail;
  String? url;
  DateTime? dateCadastro;
  String? pierSitReg;
  bool? assistida;

  Aula({
    this.id = 0,
    this.titulo = '',
    this.descricao = '',
    this.thumbnail = '',
    this.url = '',
    this.dateCadastro,
    this.pierSitReg,
    this.assistida = false
  });
}
