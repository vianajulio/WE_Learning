class Topico {
  int? id;
  String autor;
  String? assunto;
  List<String> topico;
  DateTime? data;

  Topico({required this.autor, this.assunto,required this.topico});

}

class Filtro {
  String tipo;
  Filtro(this.tipo);
}