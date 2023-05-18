import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/ui/pages/forum/forum_page.dart';

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
      // home: LoginPage(),
      home: ForumPage(),
    );
  }
}