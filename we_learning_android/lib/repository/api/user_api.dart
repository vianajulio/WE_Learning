import 'dart:convert';
import 'package:we_learning_android/entities/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static final UserApi instance = UserApi._();
  UserApi._();

  Future<User?> login(String email, String password) async {
    try {
      Map<String, dynamic> encodeString = {
        "email": email,
        "password": password,
      };

      var encode = json.encode(encodeString);

      var url = Uri.https('apiwelearn.azurewebsites.net', '/api/usuario/login');

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
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> cadastroUsuario(User user) async {
    try {
      Map<String, dynamic> encodeString = {
        "id": 0,
        "name": user.name,
        "email": user.email,
        "password": user.password,
        "userType": '${user.userType! + 1}',
        "registerDate": '1977-01-01',
        "pierSitReg": user.pierSitReg,
      };

      var encode = json.encode(encodeString);

      var url =
          Uri.http('apiwelearn.azurewebsites.net', 'api/usuario/cadastrar');

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: encode,
      );

      if (response.statusCode != 200) {
        return false;
      }

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
