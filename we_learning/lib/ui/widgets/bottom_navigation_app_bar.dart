import 'package:e_learning_dev/entitites/index_model.dart';
import 'package:e_learning_dev/ui/color/colors.dart';
import 'package:flutter/material.dart';

Widget bottomAppBarMobile() {
  var indexModel = IndexModel();
  int index = 0;
  return AnimatedBuilder(
    animation: indexModel,
    builder: (context, child) {
      return BottomNavigationBar(
        backgroundColor: primaryRed,
        currentIndex: indexModel.index,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        selectedItemColor: primaryRed,
        selectedLabelStyle: const TextStyle(
          color: primaryRed,
          fontWeight: FontWeight.bold,
        ),
        unselectedIconTheme: const IconThemeData(color: tertiaryBlack),
        unselectedLabelStyle: const TextStyle(color: tertiaryBlack),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Forum",
            tooltip: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: "Aulas",
            tooltip: 'Aulas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: "Criar",
            tooltip: 'Cadastrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
            tooltip: 'Perfil',
          ),
        ],
        onTap: (value) {
          indexModel.setIndex(value);
          index = value;
        },
      );
    },
  );
}
