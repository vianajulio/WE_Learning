import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class MainBottomNavigation extends StatelessWidget {
  const MainBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
