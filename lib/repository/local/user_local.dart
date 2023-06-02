import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_learning_android/entities/user.dart';

class UserLocal {
  static final UserLocal instance = UserLocal._();
  UserLocal._();

  Future<void> saveUser(User user) async {
    String userString = json.encode(user.toJson());
    var instance = await SharedPreferences.getInstance();
    await instance.setString('user.data', userString);
  }

  Future<User?> getUser() async {
    var instance = await SharedPreferences.getInstance();
    String? userString = instance.getString('user.data');
    if (userString!.isEmpty) {
      return null;
    }
    Map<String, dynamic> userJson = json.decode(userString);
    User user = User.fromJson(userJson);
    return user;
  }

  Future<void> deleteUser() async {
    var instance = await SharedPreferences.getInstance();
    await instance.setString('user.data', '');
  }
}
