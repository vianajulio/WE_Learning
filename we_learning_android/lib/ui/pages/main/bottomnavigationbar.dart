import 'package:flutter/material.dart';
import 'package:we_learning_android/controller/navigation_controller.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:get/get.dart';

class MainBottomNavigation extends StatelessWidget {
  MainBottomNavigation({super.key});
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NavigationController(),
      builder: (controller) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Videoaula',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Criar',
          ),
        ],
        fixedColor: primaryWhite,
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryRed,
        onTap: (page) {
          controller.goToTab(page);
        },
        currentIndex: controller.currentPage.value,
      ),
    );
  }
}
