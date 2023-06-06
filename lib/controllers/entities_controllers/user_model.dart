import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/user.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/repository/api/user_api.dart';
import 'package:we_learning_android/repository/local/user_local.dart';

class UserModel extends GetxController {
  User? user;
  Future<User?>? futureUser;

  Future<void> login(String email, String password,
      {VoidCallback? onSucess, VoidCallback? onFail}) async {
    user = await UserApi.instance.login(email, password);
    if (user != null) {
      onSucess!();
      await UserLocal.saveUser(user!);
    } else {
      onFail!();
    }
  }

<<<<<<< HEAD:lib/controllers/entities_controllers/user_model.dart
  @override
  void onInit() {
    futureUser = UserLocal.getUser();
    super.onInit();
  }

=======
  Future<void> cadastrar(
      User? user1, VoidCallback onSucess, VoidCallback onFail) async {
    bool auser = await UserApi.instance.cadastroUsuario(user1!);
    if (auser) {
      onSucess();
    } else {
      onFail();
    }
  }
>>>>>>> gabriel:we_learning_android/lib/controllers/entities_controllers/user_model.dart
}
