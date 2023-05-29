import 'package:get/get.dart';
import 'package:we_learning_android/entities/category.dart';
import 'package:we_learning_android/repository/api/category_api.dart';
import 'package:we_learning_android/repository/local/category_local.dart';

class CategoryModel extends GetxController {
  Future<List<Category>?>? futureCategories;
  List<Category>? listCategories = <Category>[];
  Future<List<Category>?>? cat;
  List<String?>? lista;

  @override
  onInit() async {
    super.onInit();
    await get();
    listCategories = await futureCategories;
    await CategoryLocal.instance.saveCategory(listCategories ?? []);
  }

  Future<void> get() async {
    futureCategories = CategoryApi.instance.getAll();
  }

  List<String?>? getList() {
    cat = CategoryLocal.instance.getCategory();
    cat?.then((value) {
      value?.map((category) => lista?.add(category.name)).toList();
    });
    return lista;
  }
}
