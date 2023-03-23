import 'package:flutter/material.dart';
import 'package:e_learning_dev/ui/color/colors.dart';

AppBar appBarDesktop() {
  return AppBar(
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Image.asset(
          "assets/images/senailogo.png",
          width: 200,
        ),
      ),
      const Spacer(),
      Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.red.shade700,
              size: 32,
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ),
    ],
    backgroundColor: primaryWhite,
  );
}

BottomNavigationBar bottomAppBarMobile() {
  return BottomNavigationBar(
    backgroundColor: primaryRed,
    currentIndex: 0,
    landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    selectedItemColor: primaryRed,
    selectedLabelStyle: const TextStyle(
      color: primaryRed,
      fontWeight: FontWeight.bold,
    ),
    unselectedIconTheme: const IconThemeData(color: tertiaryBlack),
    unselectedLabelStyle: const TextStyle(color: tertiaryBlack),
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.people), label: "Forum"),
      BottomNavigationBarItem(
        icon: Icon(Icons.subscriptions),
        label: "Aulas",
      ),
      BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Criar"),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "Perfil",
      ),
    ],
  );
}
