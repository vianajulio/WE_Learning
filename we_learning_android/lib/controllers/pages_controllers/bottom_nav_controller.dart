import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:we_learning_android/ui/pages/criar/criar_page.dart';
import 'package:we_learning_android/ui/pages/forum/forum_page.dart';
import 'package:we_learning_android/ui/pages/home/home_page.dart';
import 'package:we_learning_android/ui/pages/perfil/perfil_page.dart';
import 'package:we_learning_android/ui/pages/videoaula/videoaulas_page.dart';

class BottomNavBar extends GetxController {
  var currentPage = 0.obs;

  late PageController pageController;

  List<Widget> pages = [
    const HomePage(),
    const ForumPage(),
    const VideoaulasPage(),
    const PerfilPage(),
    const CriarPage(),
  ];

  goToTab(int value) {
    currentPage.value = value;
    pageController.jumpToPage(value);
    update();
  }

  void animatedToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(
      currentPage.value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  onInit() {
    pageController = PageController(initialPage: currentPage.value);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
