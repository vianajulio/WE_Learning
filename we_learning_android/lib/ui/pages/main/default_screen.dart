import 'package:flutter/material.dart';
import 'package:we_learning_android/controllers/pages_controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/pages/perfil/perfil_page.dart';
import 'package:we_learning_android/ui/widgets/global_widgets/custom_bottom_navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: 320,
        color: primaryWhite,
        child: const PerfilPage(),
      ),
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.account_circle_rounded));
            },
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
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
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
