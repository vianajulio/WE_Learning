import 'package:intl/intl.dart';

class Topico {
  int? id;
  String? tituloTopico;
  String? descricaoTopico;
  String? nomeCategoria;
  String? nomeUsuario;
  int? idAulaTopico;
  String? dataTopico;
  String? pierSitReg;

  Topico(
      {this.id,
      this.tituloTopico,
      this.descricaoTopico,
      this.nomeCategoria,
      this.nomeUsuario,
      this.idAulaTopico,
      this.dataTopico,
      this.pierSitReg});

  factory Topico.fromJson(Map<String, dynamic> json) {
    return Topico(
      id: json['id'],
      tituloTopico: json['titulo_topico'],
      descricaoTopico: json['assunto'],
      nomeCategoria: json['categoria'],
      nomeUsuario: json['nome_usuario'],
      idAulaTopico: json['id_aula'],
      dataTopico: json['data'],
      pierSitReg: json['pier_sit_reg'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'titulo_topico': tituloTopico,
      'assunto': descricaoTopico,
      'categoria': nomeCategoria,//id categoria
      'nome_usuario': nomeUsuario,//id usuario
      'id_aula': idAulaTopico, //apenas para aulas
      'data': DateTime.now(),
    };
  }

  static List<Topico> listFromJson(List<Map<String, dynamic>> json) {
    var lista = List<Topico>.from(json.map((json) => Topico.fromJson(json)));
    return lista;
  }

  static String dataFormat(String? data) {
    var dMy = data!.substring(0, 10);

    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(dMy);

    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}
