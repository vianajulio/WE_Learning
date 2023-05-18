import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/ui/pages/forum/forum_page.dart';
import 'package:we_learning_android/ui/pages/login/login_page.dart';
import 'package:we_learning_android/ui/pages/main/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      //  home: LoginPage(),
      //home: ForumPage(),
    );
  }
}