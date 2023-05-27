import 'package:intl/intl.dart';

class Topico {
  int? id;
  String? tituloTopico;
  String? assuntoTopico;
  String? nomeCategoria;
  String? nomeUsuario;
  int? idAulaTopico;
  String? dataTopico;
  String? pierSitReg;

  Topico(
      {this.id,
      this.tituloTopico,
      this.assuntoTopico,
      this.nomeCategoria,
      this.nomeUsuario,
      this.idAulaTopico,
      this.dataTopico,
      this.pierSitReg});

  factory Topico.fromJson(Map<String, dynamic> json) {
    return Topico(
      id: json['id'],
      tituloTopico: json['titulo_topico'],
      assuntoTopico: json['assunto'],
      nomeCategoria: json['categoria'],
      nomeUsuario: json['nome_usuario'],
      idAulaTopico: json['id_aula'],
      dataTopico: json['data'],
      pierSitReg: json['pier_sit_reg'],
    );
  }

  List<Topico> listFromJson(List<Map<String, dynamic>> json) {
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
