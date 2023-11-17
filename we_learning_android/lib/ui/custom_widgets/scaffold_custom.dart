import 'package:flutter/material.dart';

import '../pages/perfil/perfil_page.dart';
import './../colors/colors.dart';
import 'custom_bottom_navigation.dart';

class ScaffoldCustom extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? drawer;
  final Widget? endDrawer;
  final bool hasEndDrawer;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? leading;

  const ScaffoldCustom({
    super.key,
    required this.body,
    this.drawer,
    this.endDrawer,
    this.hasEndDrawer = false,
    this.actions,
    this.floatingActionButton,
    this.leading,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      endDrawer: hasEndDrawer
          ? endDrawer
          : Container(
              width: 320,
              color: primaryWhite,
              child: const PerfilPage(),
            ),
      appBar: appBar ??
          AppBar(
            leading: leading,
            actions: actions ??
                [
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
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
