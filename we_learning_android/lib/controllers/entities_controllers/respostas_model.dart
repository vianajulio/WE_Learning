import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../entities/resposta.dart';
import '../../repository/api/resposta_api.dart';

class RespostaModel extends GetxController {
  Future<List<Resposta>?>? futureRespostas;
  // late int tagDuvida;

  int tag;
  RespostaModel({required this.tag});

  @override
  onInit() async {
    super.onInit();
    await getAll(tag);
  }

  // TODO trocar o initState por este método.
  Future<void> getAll(int tagDuvida) async {
    futureRespostas = RespostaApi.instance.getAll(tagDuvida);
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
