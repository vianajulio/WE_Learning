import 'package:we_learning_android/entitys/resposta.dart';
import 'package:we_learning_android/entitys/usuario.dart';

class Comentario {
  int? id;
  String? assunto;
  DateTime? dataPostagem;
  String? categoria;
  String? nome;
  String? pierSitReg;

  Comentario(
      {this.id,
      this.assunto,
      this.dataPostagem,
      this.pierSitReg,
      this.nome});
}
