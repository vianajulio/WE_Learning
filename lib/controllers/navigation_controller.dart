import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  late PageController pageController;

  /* Variável que troca o index da BottomNavigationBar */
  RxInt currentPage = 0.obs;

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
    update();
  }

  void goToTab2(int page) {
    currentPage.value = page;
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
