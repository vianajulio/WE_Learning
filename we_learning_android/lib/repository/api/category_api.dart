import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../entities/category.dart';

class CategoryApi {
  static final CategoryApi instance = CategoryApi._();
  CategoryApi._();

  Future<List<Category>> getAll() async {
    try {
      List<Category> category = [];
      var url =
          Uri.https(apiIp, '/api/categoria/listar');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        return category;
      } else {
        var listCategories =
            json.decode(response.body).cast<Map<String, dynamic>>();
        category = Category().listFromJson(listCategories);
        return category;
      }
    } catch (e) {
      rethrow;
    }
  }
}
