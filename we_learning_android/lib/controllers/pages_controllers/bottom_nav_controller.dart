import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../ui/pages/criar/criar_page.dart';
import '../../ui/pages/forum/forum_page.dart';
import '../../ui/pages/home/home_page.dart';
import '../../ui/pages/perfil/perfil_page.dart';

class BottomNavBarController extends GetxController {
  var currentPage = 0.obs;

  late PageController pageController;

  List<Widget> pages = [
    const HomePage(),
    const ForumPage(),
    // const VideoaulasPage(),
    const CriarPage(),
    const PerfilPage(),
  ];

  goToTab(int value) {
    currentPage.value = value;
    update();
    pageController.jumpToPage(value);
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
