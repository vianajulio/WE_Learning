import 'package:get/get.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/repository/api/topico_api.dart';

class ForumController extends GetxController {
  List<Topico>? selectedTopicos = <Topico>[].obs;

  @override
  Future<void> onInit() async {
    // adicionando topiocs
    selectedTopicos = await TopicoApi.instance.getAll();
    update();
    super.onInit();
  }

  updateValues() async {
      selectedTopicos = await TopicoApi.instance.getAll();
  }

  //opções para alterar os valores do radio btn dos filtros
  var _option = 'Todos';
  get option => _option;

  void opcoes(String value) {
    _option = value;
    update();
  }

  // Filtrar os itens por tags
  void filterBag(String tag) async {
    if (tag == 'Todos') {
      selectedTopicos = await TopicoApi.instance.getAll();
      update();
    } else {
      selectedTopicos = await TopicoApi.instance.getSelectedTopics(tag);
      update();
    }
  }

}
