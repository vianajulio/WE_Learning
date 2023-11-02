import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../entities/user.dart';
import '../../repository/api/user_api.dart';
import '../../repository/local/user_local.dart';

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

  @override
  void onInit() {
    futureUser = UserLocal.getUser();
    super.onInit();
  }

}
