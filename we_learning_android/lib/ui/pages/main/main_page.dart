import 'package:flutter/material.dart';
import 'package:we_learning_android/controllers/pages_controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/ui/widgets/custom_bottom_navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
