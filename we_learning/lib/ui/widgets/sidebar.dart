import 'package:e_learning_dev/ui/widgets/menu_item.dart';
import 'package:e_learning_dev/ui/widgets/menu_item_notification.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320,
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.indigo),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "NOME E SOBRENOME",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
          MenuItem(
            text: "Home",
            page: '/',
          ),
          MenuItem(
            text: "Fórum",
            page: '/forum',
          ),
          MenuItem(
            text: "Aulas",
            page: '/videoaula',
          ),
          MenuItem(
            text: "Cadastrar",
            page: '/',
          ),
          MenuItemNotification(
            text: "Notificações",
            notificationText: "4",
          )
        ],
      ),
    );
  }
}
