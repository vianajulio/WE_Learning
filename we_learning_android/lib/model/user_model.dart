import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/user.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/repository/api/user_api.dart';
import 'package:we_learning_android/repository/local/user_local.dart';

class UserModel extends GetxController {
  User? user;

  void login(int idValue, {VoidCallback? onSucess, VoidCallback? onFail}) async {
    user = await UserApi.instance.getUser(idValue);
    update();
    if (user != null) {
      // onSucess();
      await UserLocal.instance.saveUser(user!);
    } else {
      // onFail();
    }
    // return '';
  }
}
