import 'package:get/get.dart';

class MateriaController extends GetxController {
  var expansionChanged = false.obs;

  onExpansionChanged() {
    expansionChanged.value = !expansionChanged.value;
    update();
    return expansionChanged;
  }



}