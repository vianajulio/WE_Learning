import 'dart:io';

import 'package:flutter/material.dart';
import 'ui/pages/home/home_page.dart';
import 'entities/user.dart';
import 'repository/local/user_local.dart';
import 'myapp.dart';
import 'ui/pages/login/login_page.dart';

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

  // runApp(MyApp(home: email == null ? LoginPage() : const HomePage()));
  runApp(MyApp(home: HomePage()));
}
