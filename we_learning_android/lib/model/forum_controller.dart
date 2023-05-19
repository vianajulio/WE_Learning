import 'package:get/get.dart';
import 'package:we_learning_android/entities/topico.dart';

class ForumController extends GetxController {
  var _topicos = <Topico>[].obs;
  var _selectedTopicos = <Topico>[].obs;


  var _filtros = {
    'Todos',
    'SOP',
    'LMA',
    'HARE',
    'FPOO',
    'Outros',
  }.obs;

  @override
  void onInit() {
    super.onInit();
    // adicionando itens para teste
      _selectedTopicos.assignAll(_topicos);
  }


  // Filtrar os itens por tags
  void filterBag(String tag) async {

    if (tag == 'Todos') {
      _filtros.updateAll((key, value) => value = true);
     
      _selectedTopicos.assignAll(_topicos);
    } else {
      // _selectedTopicos.assignAll(_topicos.where((item) => item.topico.contains(tag)).toList());
    }
  }

  void  toggle(Filtro item){
    _filtros[item] = !(_filtros[item] ?? true);
    if (_filtros[item] == false) {
      _selectedTopicos.removeWhere((itemFiltro) => itemFiltro.topico.contains(item.tipo));
    }
  }
  
  // get selectedTopicos => _selectedTopicos;
  // get selectedFilter => _filtros.entries.where((element) => element.value).map((e) => e.key).toList();
  // get filter => _filtros.entries.map((e) => e.key).toList();
}
