import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:we_learning_android/controllers/pages_controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/ui/widgets/custom_bottom_navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
=======
import 'package:we_learning_android/controllers/navigation_controller.dart';
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
>>>>>>> Jaqueline

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: GetBuilder(
        init: BottomNavBarController(),
        builder: (controller) => PageView(
          controller: controller.pageController,
          children: controller.pages,
          onPageChanged: (value) {
            controller.animatedToTab(value);
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
=======
      body: PageView(
        //physics: const   BouncingScrollPhysics(),
        controller: controller.pageController,
        children:  [
          HomePage(),
          ForumPage(),
          VideoaulasPage(),
          CriarPage(),
        ],
        onPageChanged: (value) {
          controller.goToTab2(value);
        },
      ),
      bottomNavigationBar: MainBottomNavigation(),
>>>>>>> Jaqueline
    );
  }
}
