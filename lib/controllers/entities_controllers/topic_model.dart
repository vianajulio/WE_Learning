<<<<<<< HEAD
import 'dart:ui';

import 'package:get/get.dart';
import 'package:we_learning_android/entities/category.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/entities/user.dart';
import 'package:we_learning_android/repository/api/topico_api.dart';
import 'package:we_learning_android/repository/local/category_local.dart';
import 'package:we_learning_android/repository/local/user_local.dart';

class TopicModel extends GetxController {
=======
import 'package:get/get.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/repository/api/topico_api.dart';

class TopicModel extends GetxController{
>>>>>>> Jaqueline
  Future<List<Topico>?>? futureTopics;

  @override
  onInit() async {
    super.onInit();
    await get();
  }
<<<<<<< HEAD

=======
  
>>>>>>> Jaqueline
  get topics => futureTopics;

  Future<void> get() async {
    futureTopics = TopicoApi.instance.getAll();
  }

<<<<<<< HEAD
  Future<void> post(
    String titulo,
    String descricao, {
    VoidCallback? onSucess,
    VoidCallback? onFail,
  }) async {
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

  static Future<void> put(
    int id_topico, {
    VoidCallback? onSucess,
    VoidCallback? onFail,
  }) async {
    bool? alterado = await TopicoApi.instance.putTopicDes(id_topico);

      if (alterado == true) {
        onSucess!();
      } else {
        onFail!();
      }
  }
}
=======
  Future<List<Topico>?> futureTopicApp() async {
    return await futureTopics;
  }

}
>>>>>>> Jaqueline
