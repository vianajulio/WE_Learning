import 'package:get/get.dart';
import 'package:we_learning_android/entities/topicoapp.dart';
import 'package:we_learning_android/model/topic_model.dart';
import 'package:we_learning_android/repository/api/topico_api.dart';

class ForumController extends GetxController {
  late List<TopicoApp>? _topicos = <TopicoApp>[].obs;
  List<TopicoApp>? selectedTopicos = <TopicoApp>[].obs;
  TopicModel model = TopicModel();

  //TODO fazer um método para atualizar a lista de acordo com o BD
  final List<String> _filtros = [
    'Todos',
    'SOP',
    'LMA',
    'HARE',
    'FPOO',
    'Outros',
  ].obs;

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
      selectedTopicos?.assignAll(_topicos!
          .where((item) => item.nome_categoria!.contains(tag))
          .toList());
      update();
    }
  }

  get filter => _filtros;
}
