import 'dart:ui';

import 'package:get/get.dart';
import '../../entities/category.dart';
import '../../entities/topico.dart';
import '../../entities/user.dart';
import '../../repository/api/topico_api.dart';
import '../../repository/local/categoryLocal.dart';
import '../../repository/local/userLocal.dart';

class TopicModel extends GetxController {
  Future<List<Topico>?>? futureTopics;

  @override
  onInit() async {
    super.onInit();
    await get();
  }

  get topics => futureTopics;

  Future<void> get() async {
    futureTopics = TopicoApi.instance.getAll();
  }

  Future<void> post(String titulo, String descricao,
      {VoidCallback? onSucess, VoidCallback? onFail}) async {
    User? usuario = await UserLocal.getUser();
    int? idUsuario = usuario?.id;
    
    Category? category = await CategoryLocal.instance.getId();
    bool cadastrado = await TopicoApi.instance
        .cadastroTopico(titulo, descricao, category?.id ?? 0, idUsuario ?? 0);

    if (cadastrado == true) {
      onSucess!();
    } else {
      onFail!();
    }
  }
}
