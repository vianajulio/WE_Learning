class Usuario {
  int? id;
  String? nome;
  String? email;
  String? senha;
  int? tipo;
  DateTime? dataCadastro;
  String? pierSitReg;

  Usuario(
      {this.id = 0,
      this.nome = '',
      this.email = '',
      this.senha = '',
      this.tipo = 0,
      this.dataCadastro,
      this.pierSitReg});
}
 