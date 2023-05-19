import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/pages/main/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeLearning',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      // home: ForumPage(),
      home: MainPage(),
    );
  }
}