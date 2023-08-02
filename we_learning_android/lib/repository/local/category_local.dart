import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_learning_android/entities/category.dart';

class CategoryLocal {
  static final CategoryLocal instance = CategoryLocal._();
  CategoryLocal._();

  Future<void> saveCategory(List<Category> category) async {
    String categoryString = json.encode(category);
    var instance = await SharedPreferences.getInstance();
    await instance.setString('category.list', categoryString);
  }

  Future<List<Category>?>? getCategory() async {
    var instance = await SharedPreferences.getInstance();
    String? categoryString = instance.getString('category.list');
    if (categoryString!.isEmpty) {
      return null;
    }

    var categoryJson = json.decode(categoryString);
    List<Category> category = Category().listFromJsonDynamic(categoryJson);
    return category;
  }

  Future<void> deleteCategory() async {
    var instance = await SharedPreferences.getInstance();
    await instance.setString('category.list', '');
  }

  Future<void> saveId(Category category) async {
    String categoryString = json.encode(category);
    var instance = await SharedPreferences.getInstance();
    await instance.setString('category.data', categoryString);
  }

  Future<Category?> getId() async {
    var instance = await SharedPreferences.getInstance();
    String? categoryString = instance.getString('category.data');
    if (categoryString!.isEmpty) {
      return null;
    }
    var categoryJson = json.decode(categoryString);
    Category category2 = Category.fromJson(categoryJson);
    return category2;
  }


  
}
