import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:we_learning_android/controllers/bottom_nav_controller.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});


  List<BottomNavigationBarItem> bottomItens = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: "Forum"),
    BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: "Aulas"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
    BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Criar"),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BottomNavBar(),
      builder: (controller) {
        return BottomNavigationBar(
          currentIndex: controller.currentPage.value,
          items: bottomItens,
          onTap: (newIndex) {
            controller.goToTab(newIndex);
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
      },
    );
  }
}
