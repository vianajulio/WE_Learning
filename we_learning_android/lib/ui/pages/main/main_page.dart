import 'package:flutter/material.dart';
import 'package:we_learning_android/controller/navigation_controller.dart';
//import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/pages/criar/criar_page.dart';
import 'package:we_learning_android/ui/pages/forum/forum_page.dart';
import 'package:we_learning_android/ui/pages/home/home_page.dart';
import 'package:we_learning_android/ui/pages/main/bottomnavigationbar.dart';
import 'package:we_learning_android/ui/pages/videoaula/videoaulas_page.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //physics: const   BouncingScrollPhysics(),
        controller: controller.pageController,
        children:  [
          const HomePage(),
          ForumPage(),
          const VideoaulasPage(),
          const CriarPage(),
        ],
        onPageChanged: (value) {
          controller.goToTab2(value);
        },
      ),
      bottomNavigationBar: MainBottomNavigation(),
    );
  }
}
