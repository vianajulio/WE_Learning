import 'package:we_learning_dev/ui/color/colors.dart';
import 'package:we_learning_dev/ui/responsive/responsive.dart';
import 'package:we_learning_dev/ui/widgets/app_bar.dart';
import 'package:we_learning_dev/ui/widgets/sidebar.dart';
import 'package:flutter/material.dart';

//classe responsável por definir um padrão de scaffold para o projeto
class ScaffoldBasic extends StatelessWidget {
  Widget body;

  ScaffoldBasic({required this.body});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryWhite,
      endDrawer: const SideBar(),
      appBar: (size.width > desktopWidth ? appBarDesktop() : null),
      bottomNavigationBar:
          (size.width < desktopWidth ? bottomAppBarMobile() : null),
      body: body,
    );
  }
}
