import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../entities/category.dart';

class CategoryApi {
  static final CategoryApi instance = CategoryApi._();
  CategoryApi._();

  Future<List<Category>> getAll() async {
    try {
      var url = Uri.https(apiIp, '/api/categoria/listar');

      var response = await http.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );

      if (response.statusCode != 200) {
        return [];
      } else {
        var listCategories =
            json.decode(response.body).cast<Map<String, dynamic>>();
        List<Category>? category = Category().listFromJson(listCategories);
        return category;
      }
    } catch (e) {
      rethrow;
    }
  }
}
