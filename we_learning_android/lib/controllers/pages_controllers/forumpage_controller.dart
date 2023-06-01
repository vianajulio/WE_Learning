import 'package:get/get.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/repository/api/topico_api.dart';

class ForumController extends GetxController {
  late List<Topico>? _topicos = <Topico>[].obs;
  List<Topico>? selectedTopicos = <Topico>[].obs;

  @override
  Future<void> onInit() async {
    // adicionando topiocs
    _topicos = await TopicoApi.instance.getAll();
    selectedTopicos = _topicos;

    update();
    super.onInit();
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
      _topicos = await TopicoApi.instance.getAll();
      selectedTopicos?.assignAll(_topicos!);
      update();
    } else {
      selectedTopicos = await TopicoApi.instance.getSelectedTopics(tag);
      update();
    }
  }

}
