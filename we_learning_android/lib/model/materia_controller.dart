import 'package:get/get.dart';

class MateriaController extends GetxController {
  var expansionChanged = true.obs;

  bool  onExpansionChanged(bool value) {
    expansionChanged.value = !expansionChanged.value;
    value = expansionChanged.value;
    update();
    return value;
  }

  filterList(List<String> list) {



  }

}