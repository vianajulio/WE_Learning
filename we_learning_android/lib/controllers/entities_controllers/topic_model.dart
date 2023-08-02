import 'dart:ui';

import 'package:get/get.dart';
import 'package:we_learning_android/entities/category.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/entities/user.dart';
import 'package:we_learning_android/repository/api/topico_api.dart';
import 'package:we_learning_android/repository/local/category_local.dart';
import 'package:we_learning_android/repository/local/user_local.dart';

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
    User? usuario = await UserLocal.instance.getUser();
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
