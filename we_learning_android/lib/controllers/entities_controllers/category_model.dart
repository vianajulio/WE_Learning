import 'package:get/get.dart';
import 'package:we_learning_android/entities/category.dart';
import 'package:we_learning_android/repository/api/category_api.dart';
import 'package:we_learning_android/repository/local/category_local.dart';

class CategoryModel extends GetxController{
  Future<List<Category>?>? futureCategories;
  List<Category>? listCategories = <Category>[];

  @override
  onInit() async {
    await get();
    listCategories = await futureCategories;
    await CategoryLocal.instance.saveCategory(listCategories ?? []);
  }

  Future<void> get() async {
    futureCategories = CategoryApi.instance.getAll();
  }
}
