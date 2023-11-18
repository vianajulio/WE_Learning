import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../entities/resposta.dart';
import '../../repository/api/resposta_api.dart';

class RespostaModel extends GetxController {
  Future<List<Resposta>?>? futureRespostas;
  var loadResposta = false.obs;

  // TODO trocar o initState por este método.
  Future<void> getAll(int tagDuvida) async {
    loadResposta.value = true;
    update();
    futureRespostas = RespostaApi.instance.getAll(tagDuvida);
    Future.delayed(const Duration(seconds: 5))
        .then((value) => loadResposta.value = false);
    update();
  }

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
