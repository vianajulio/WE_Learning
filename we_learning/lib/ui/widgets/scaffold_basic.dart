import 'package:e_learning_dev/entitites/index_model.dart';
import 'package:e_learning_dev/ui/color/colors.dart';
import 'package:e_learning_dev/ui/responsive/responsive.dart';
import 'package:e_learning_dev/ui/widgets/app_bar.dart';
import 'package:e_learning_dev/ui/widgets/bottom_navigation_app_bar.dart';
import 'package:e_learning_dev/ui/widgets/sidebar.dart';
import 'package:flutter/material.dart';

//classe responsável por definir um padrão de scaffold para o projeto
class ScaffoldBasic extends StatelessWidget {
  Widget body;
  Widget? floatingActionButton;

  ScaffoldBasic({required this.body, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    IndexModel indexModel = IndexModel();
    return Scaffold(
      backgroundColor: secondaryWhite,
      endDrawer: const SideBar(),
      appBar: (size.width > desktopWidth ? appBarDesktop() : null),
      bottomNavigationBar:
          (size.width < desktopWidth ? bottomAppBarMobile() : null),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
