import 'package:get/get.dart';
import 'package:we_learning_android/entities/category.dart';
import 'package:we_learning_android/repository/api/category_api.dart';
import 'package:we_learning_android/repository/local/category_local.dart';

class CategoryModel extends GetxController {
  Future<List<Category>?>? futureCategories;
  List<Category>? listCategories = <Category>[];
  var dropDownValue = "Todos";
  String? idCategoria;

  @override
  onInit() async {
    super.onInit();
    await get();
    // listCategories = await futureCategories;
    await CategoryLocal.instance.saveCategory(listCategories ?? []);
  }

  Future<void> get() async {
    futureCategories = CategoryApi.instance.getAll();
    listCategories = await futureCategories;
  }

  void onPressDropButton(String? value){
    dropDownValue = value!;
    update();
  }

  Future<void> updateId(Category category) async {
      idCategoria = category.id.toString();
      await CategoryLocal.instance.saveId(category);
      update();
  }

}
