import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/pages_controllers/bottom_nav_controller.dart';
import '../colors/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});

  final BottomNavBarController controller = Get.put(BottomNavBarController());

  final List<BottomNavigationBarItem> bottomItens = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: "Forum"),
    BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: "Aulas"),
    BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Criar"),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.currentPage.value,
      items: bottomItens,
      onTap: (newIndex) {
        controller.goToTab(newIndex, context);
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryRed,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      selectedItemColor: primaryWhite,
      selectedLabelStyle: const TextStyle(
        color: primaryRed,
        fontWeight: FontWeight.bold,
      ),
      unselectedIconTheme: const IconThemeData(color: tertiaryBlack),
      unselectedLabelStyle: const TextStyle(color: tertiaryBlack),
    );
  }
}
