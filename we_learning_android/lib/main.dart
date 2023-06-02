import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/user.dart';
import 'package:we_learning_android/myapp.dart';
import 'package:we_learning_android/repository/local/user_local.dart';
import 'package:we_learning_android/ui/pages/login/login_page.dart';
import 'package:we_learning_android/ui/pages/main/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  User? user = await UserLocal.getUser();
  var email = user?.email ?? '';

  runApp(MyApp(home: email == null ? LoginPage() : MainPage()));
}
