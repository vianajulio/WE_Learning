class TopicoApp {
  int? id;
  String? assunto_topico;
  String? pier_sit_reg;
  String? data_topico;
  String? nome_categoria;
  String? nome_usuario;

  TopicoApp({
    this.id,
    this.assunto_topico,
    this.pier_sit_reg,
    this.data_topico,
    this.nome_categoria,
    this.nome_usuario,
  });

  factory TopicoApp.fromJson(Map<String, dynamic> json) {
    return TopicoApp(
      id: json['id'],
      pier_sit_reg: json['pierSitReg'],
      assunto_topico: json['assunto'],
      data_topico: json['data'],
      nome_categoria: json['categoria'],
      nome_usuario: json['nome_Usuario'],
    );
  }

  List<TopicoApp> listFromJson(List<Map<String, dynamic>> json){
    var lista = List<TopicoApp>.from(json.map((json) => TopicoApp.fromJson(json)));
    print(lista);
    return lista;
  }

}