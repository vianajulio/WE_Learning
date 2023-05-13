import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/pages/criar/criar_page.dart';
import 'package:we_learning_android/ui/pages/forum/forum_page.dart';
import 'package:we_learning_android/ui/pages/home/home_page.dart';
import 'package:we_learning_android/ui/pages/main/bottomnavigationbar.dart';
import 'package:we_learning_android/ui/pages/videoaula/videoaula_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children:  [
          HomePage(),
          ForumPage(),
          VideoaulaPage(),
          CriarPage(),
        ],
        onPageChanged: (value) {},
      ),
      bottomNavigationBar: MainBottomNavigation(),
    );
  }
}
