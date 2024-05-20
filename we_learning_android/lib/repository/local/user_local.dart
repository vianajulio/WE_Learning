import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../entities/user.dart';

class UserLocal {
  // static final UserLocal instance = UserLocal._();
  // UserLocal._();

  static Future<void> saveUser(User user) async {
    String userString = json.encode(user.toJson());
    var instance = await SharedPreferences.getInstance();
    await instance.setString('user.data', userString);
  }

  static Future<User?> getUser() async {
    var instance = await SharedPreferences.getInstance();
    String? userString = instance.getString('user.data');
    if (userString == null) {
      return null;
    }

    print(userString);

    Map<String, dynamic> userJson = json.decode(userString!);
    User user = User.fromJson(userJson);
    return user;
  }

  static Future<void> deleteUser() async {
    var instance = await SharedPreferences.getInstance();
    await instance.setString('user.data', '');
  }
}
