import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/pages/criar/criar_user.dart';
<<<<<<< HEAD
import 'package:we_learning_android/ui/pages/criar/criar_aula.dart';
=======
>>>>>>> Jaqueline

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
<<<<<<< HEAD
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
=======
                  Tab(text: 'Aulas'),
                ],
              ),
              Expanded(
>>>>>>> Jaqueline
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

_componenteFoda({String? label, Icon? icon}) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon!,
        Text(label.toString(), textAlign: TextAlign.center),
      ],
    ),
  );
}
