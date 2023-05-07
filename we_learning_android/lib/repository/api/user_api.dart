import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:we_learning_android/entities/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static final UserApi instance = UserApi._();
  UserApi._();

  Future<User?> login(String email, String password) async {
    try {
      var encodeString = {"email": email, "password": password};

      var encode = json.encode(encodeString);

      var url = Uri.https('weleaningapi.azurewebsites.net', '/api/User/login');

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: encode,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            json.decode(utf8.decode(response.bodyBytes));
        User user = User.fromJson(responseData);
        return user;
      } else {
        print('n deu certo');
        return null;
      }
    } catch (e) {
      print('getUser: $e');
      return null;
    }
  }
}
