import 'package:scoped_model/scoped_model.dart';
import 'package:we_learning_dev/models/navigationModel.dart';
import 'package:we_learning_dev/ui/color/colors.dart';
import 'package:we_learning_dev/ui/pages/home/widgets/item_notificacao.dart';
import 'package:we_learning_dev/ui/pages/home/widgets/menu_item.dart';
import 'package:we_learning_dev/ui/pages/home/widgets/menu_item_notification.dart';
import 'package:we_learning_dev/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with TickerProviderStateMixin {
  List<Widget> menuItem = [
    MenuItem(
      text: "Home",
      index: 0,
    ),
    MenuItem(
      text: "Fórum",
      index: 1,
    ),
    MenuItem(
      text: "Aulas",
      index: 2,
    ),
    MenuItem(
      text: "Cadastrar",
      index: 3,
    ),
  ];

  late final AnimationController _animmarionController;
  late Animation<double> animation;

  @override
  void initState() {
    _animmarionController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this)
          ..addListener(() {
            setState(() {});
          });
    animation = Tween<double>(begin: 0, end: -1).animate(CurvedAnimation(
        parent: _animmarionController, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    _animmarionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320,
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      child: ScopedModelDescendant<NavigationModel>(
        builder: (context, child, navigationModel) {
          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 16.0),
                children: [
                  Row(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.indigo,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "NOME E SOBRENOME",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "EMAIL INSTITUCIONAL",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(children: menuItem),
                  MenuItemNotification(
                    text: "Notificações",
                    notificationText: "4",
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: _animmarionController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      navigationModel.drawerNotification
                          ? animation.value
                          : 320,
                      0,
                    ),
                    child: Container(
                      color: primaryWhite,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () {
                                  navigationModel.drawerNotification =
                                      !navigationModel.drawerNotification;

                                  if (navigationModel.drawerNotification) {
                                    _animmarionController.forward();
                                  } else {
                                    _animmarionController.reverse();
                                  }
                                  navigationModel.setState();
                                },
                                icon: Icon(Icons.close_rounded)),
                          ),
                          Center(
                              child: CustomText(
                            text: 'Notificações',
                            fontWeight: FontWeight.w600,
                          )),
                          Divider(thickness: 2),
                          Expanded(child: ItemNotificacao()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
