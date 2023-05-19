import 'package:get/get.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/entities/topicoapp.dart';
import 'package:we_learning_android/model/topic_model.dart';
import 'package:we_learning_android/repository/api/topico_api.dart';

class ForumController extends GetxController {
  late List<TopicoApp>? _topicos = <TopicoApp>[].obs;
  List<TopicoApp>? selectedTopicos = <TopicoApp>[].obs;
  TopicModel model = TopicModel();


  var _filtros = {
    Filtro('Todos'): false,
    Filtro('SOP'): false,
    Filtro('LMA'): false,
    Filtro('HARE'): false,
    Filtro('FPOO'): false,
    Filtro('Outros'): false,
  }.obs;

  @override
  Future<void> onInit() async {
    // adicionando topiocs
    _topicos = await TopicoApi.instance.getAll();
    selectedTopicos = _topicos;
    update();
    super.onInit();
  }

  // Filtrar os itens por tags
  void filterBag(String tag) async {
    if (tag == 'Todos') {
      // _topicos = await TopicoApi.instance.getAll();
      selectedTopicos?.assignAll(_topicos!);
      update();
    } else {
      selectedTopicos?.assignAll(_topicos!
          .where((item) => item.nome_categoria!.contains(tag))
          .toList());
      update();
    }
  }

  void toggle(Filtro item) {
    _filtros[item] = !(_filtros[item] ?? true);
    if (_filtros[item] == false) {
      selectedTopicos?.removeWhere(
          (itemFiltro) => itemFiltro.nome_categoria!.contains(item.tipo));
    }
  }

  get selectedFilter => _filtros.entries
      .where((element) => element.value)
      .map((e) => e.key)
      .toList();
  get filter => _filtros.entries.map((e) => e.key).toList();
}
