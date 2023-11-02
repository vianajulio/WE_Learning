import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:we_learning_android/ui/pages/aulas/aulas_page.dart';
import '../../ui/pages/criar/criar_page.dart';
import '../../ui/pages/forum/forum_page.dart';
import '../../ui/pages/home/home_page.dart';

class BottomNavBarController extends GetxController {
  var currentPage = 0.obs;

  late PageController pageController;

  List<Widget> pages = [
    const HomePage(),
    const ForumPage(),
    const AulasPage(),
    const CriarPage(),
  ];

  void goToTab(int value, BuildContext context) {
    print(value);
    if (currentPage.value != value) {
      currentPage.value = value;
      update();
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => pages[value],
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 0.0);
            const end = Offset.zero;
            final twenn = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(twenn);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    }
  }

  // void animatedToTab(int page) {
  //   currentPage.value = page;
  //   pageController.animateToPage(
  //     currentPage.value,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.ease,
  //   );
  // }

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
