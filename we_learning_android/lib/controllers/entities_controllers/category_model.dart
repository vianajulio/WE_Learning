import 'package:get/get.dart';

import '../../entities/category.dart';
import '../../repository/api/category_api.dart';
import '../../repository/local/category_local.dart';

class CategoryModel extends GetxController {
  // Future<List<Category>?>? futureCategories;

  Future<List<Category>>? listCategories;

  var dropDownValue = "Selecione uma categoria.";
  String? idCategoria;

  @override
  onInit() async {
    await fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    listCategories = Future.value(await CategoryApi.instance.getAll());
    update();
  }

  void onPressDropButton(String? value) {
    dropDownValue = value ?? "";
    update();
  }

  Future<void> updateId(Category category) async {
    idCategoria = category.id.toString();
    await CategoryLocal.instance.saveId(category);
    update();
  }
}
