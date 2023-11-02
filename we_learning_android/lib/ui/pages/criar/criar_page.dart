import 'package:flutter/material.dart';

import 'criar_aula.dart';
import 'criar_user.dart';

class CriarPage extends StatelessWidget {
  const CriarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 50.0,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  "Criar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: const TabBar(
                  tabs: [
                    Tab(
                      text: 'Usuário',
                    ),
                    Tab(text: 'Aulas'),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    CriarUser(),
                    CriarAula(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// _componenteFoda({String? label, Icon? icon}) {
//   return Container(
//     padding: const EdgeInsets.all(20),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         icon!,
//         Text(label.toString(), textAlign: TextAlign.center),
//       ],
//     ),
//   );
// }
