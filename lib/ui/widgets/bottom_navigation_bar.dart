import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:we_learning_dev/models/navigationModel.dart';
import 'package:we_learning_dev/ui/color/colors.dart';

class CustomBottomNavigatiomBar extends StatefulWidget {

  @override
  State<CustomBottomNavigatiomBar> createState() =>
      _CustomBottomNavigatiomBarState();
}

class _CustomBottomNavigatiomBarState extends State<CustomBottomNavigatiomBar>
    with TickerProviderStateMixin {

  int _currentIndex = 0;

  List<BottomNavigationBarItem> bottomItens = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: "Forum"),
    BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: "Aulas"),
    BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Criar"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
  ];

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<NavigationModel>(
        builder: (context, child, navigationModel) {
      return BottomNavigationBar(
        backgroundColor: primaryRed,
        currentIndex: navigationModel.indexNavigation,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        selectedItemColor: primaryRed,
        selectedLabelStyle: const TextStyle(
          color: primaryRed,
          fontWeight: FontWeight.bold,
        ),
        unselectedIconTheme: const IconThemeData(color: tertiaryBlack),
        unselectedLabelStyle: const TextStyle(color: tertiaryBlack),
        items: bottomItens,
        onTap: (newIndex) {
          navigationModel.newIndex(newIndex);
        },
      );
    });
  }
}
