import 'dart:convert';
import 'package:we_learning_android/entities/user.dart';
import 'package:we_learning_android/constants/constants.dart';
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

      // var url = Uri.http('192.168.0.203:7285', '/api/usuario/login');
      var url = Uri.https(apiIp, '/api/usuario/login');

      // recebe os dados do User e gerencia o tempo para realizar o post
      var response = await http
          .post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: encode,
      )
          .timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          return http.Response('Error', 408);
        },
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
}
