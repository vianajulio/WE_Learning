import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/user.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/repository/api/user_api.dart';
import 'package:we_learning_android/repository/local/user_local.dart';

class UserModel extends GetxController {
  User? user;

  Future<void> login(String email, String password,
      {VoidCallback? onSucess, VoidCallback? onFail}) async {
    user = await UserApi.instance.login(email, password);
    if (user != null) {
      onSucess!();
      await UserLocal.instance.saveUser(user!);
    } else {
      onFail!();
    }
  }
}
