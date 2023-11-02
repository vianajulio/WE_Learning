import 'dart:io';

import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/user.dart';
import 'package:we_learning_android/repository/local/userLocal.dart';
import 'package:we_learning_android/ui/main/myapp.dart';
import 'package:we_learning_android/ui/pages/login/login_page.dart';
import 'package:we_learning_android/ui/pages/main/default_screen.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = PostHttpOverrides();

  User? user = await UserLocal.getUser();
  String? email = user?.email;

  runApp(MyApp(home: email == null ? LoginPage() : const MainPage()));
}
