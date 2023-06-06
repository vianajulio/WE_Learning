import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:we_learning_android/entities/resposta.dart';
import 'package:we_learning_android/repository/api/resposta_api.dart';

class RespostaModel extends GetxController {
=======
import 'package:we_learning_android/entities/resposta.dart';

class RespostaModel extends GetxController{
>>>>>>> Jaqueline
  Future<List<Resposta>?>? futureRespostas;

  @override
  onInit() async {
    super.onInit();
    // await getAll();
  }

<<<<<<< HEAD
  // TODO trocar o initState por este método.
=======
>>>>>>> Jaqueline
  // Future<void> getAll() async {
  //   futureRespostas = RespostaApi.instance.getAll();
  // }

<<<<<<< HEAD
  Future<void>? post(Resposta resposta,
      {Callback? onSucess, Callback? onFail}) async {
    bool cadastrado = await RespostaApi.instance.post(
      resposta.usuario ?? "",
      resposta.conteudoResposta ?? "",
      resposta.idTopico ?? 0,
    );
    if (cadastrado) {
      onSucess!();
    } else {
      onFail!();
    }
  }

  void recarregarPagina() {
    refresh();
  }
}
=======
}
>>>>>>> Jaqueline
