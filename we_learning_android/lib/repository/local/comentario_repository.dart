
import 'package:we_learning_android/entities/comentario.dart';

class ComentariosRepository {
  static List<Comentario> comentarios = [
    Comentario(
        id: 1,
        assunto: 'Teste',
        dataPostagem: DateTime.now(),
        pierSitReg: 'ATV',
        nome: 'nome Teste'),
    Comentario(
        id: 2,
        assunto: 'Teste1',
        dataPostagem: DateTime.now(),
        pierSitReg: 'ATV',
        nome: 'nome Teste1'),
    Comentario(
        id: 3,
        assunto: 'Teste2',
        dataPostagem: DateTime.now(),
        pierSitReg: 'ATV',
        nome: 'nome Teste2'),
    Comentario(
        id: 4,
        assunto: 'Teste3',
        dataPostagem: DateTime.now(),
        pierSitReg: 'ATV',
        nome: 'nome Teste3'),
  ];

  List<Comentario> retornarComentarios() {
    //list json

    List<Comentario> comentarios = [];

    for (var i = 0; i < 10; i++) {
      comentarios.add(Comentario());
    }

    return comentarios;
  }
}
