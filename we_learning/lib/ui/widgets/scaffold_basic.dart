<<<<<<< HEAD:we_learning/lib/ui/widgets/scaffold_basic.dart
import 'package:e_learning_dev/entitites/index_model.dart';
import 'package:e_learning_dev/ui/color/colors.dart';
import 'package:e_learning_dev/ui/responsive/responsive.dart';
import 'package:e_learning_dev/ui/widgets/app_bar.dart';
import 'package:e_learning_dev/ui/widgets/bottom_navigation_app_bar.dart';
import 'package:e_learning_dev/ui/widgets/sidebar.dart';
=======
import 'package:scoped_model/scoped_model.dart';
import 'package:we_learning_dev/models/navigationModel.dart';
import 'package:we_learning_dev/ui/color/colors.dart';
import 'package:we_learning_dev/ui/pages/forum/forum_page.dart';
import 'package:we_learning_dev/ui/pages/home/home_page.dart';
import 'package:we_learning_dev/ui/pages/videoaula/videoaula_page.dart';
import 'package:we_learning_dev/ui/responsive/responsive.dart';
import 'package:we_learning_dev/ui/widgets/app_bar.dart';
import 'package:we_learning_dev/ui/pages/home/widgets/sidebar.dart';
import 'package:we_learning_dev/ui/widgets/bottom_navigation_bar.dart';
>>>>>>> julio:lib/ui/widgets/scaffold_basic.dart
import 'package:flutter/material.dart';

//classe responsável por definir um padrão de scaffold para o projeto
class ScaffoldBasic extends StatelessWidget {
<<<<<<< HEAD:we_learning/lib/ui/widgets/scaffold_basic.dart
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
=======
  List<Widget> tab = const [
    HomePage(),
    ForumPage(),
    VideoAulaPage(),
    HomePage(),
    HomePage()
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ScopedModelDescendant<NavigationModel>(
        builder: (context, child, model) {
      return Scaffold(
        backgroundColor: secondaryWhite,
        endDrawer: SideBar(),
        onEndDrawerChanged: (isOpened) {
          if (!isOpened) {
            model.drawerNotification = false;
          }
        },
        appBar: (size.width > desktopWidth ? appBarDesktop() : null),
        bottomNavigationBar:
            (size.width < desktopWidth ? CustomBottomNavigatiomBar() : null),
        body: tab[model.indexNavigation],
      );
    });
>>>>>>> julio:lib/ui/widgets/scaffold_basic.dart
  }
}
