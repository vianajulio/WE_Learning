import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class CriarPage extends StatelessWidget {
  const CriarPage({super.key});

  @override
  Widget build(BuildContext context) {
    ;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Usuário',
                  ),
                  Tab(text: 'Aulas'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                        child: Center(
                      child: Text('1st Tab'),
                    )),
                    Container(
                        child: Center(
                      child: Text('2st Tab'),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    // return Container(
    //   //child: const Center(child: CustomText(text: 'Criar'),),
    //   child: SafeArea(
    //     child: GridView.count(
    //       crossAxisCount: 2,
    //       children: [
    //         _componenteFoda(
    //           icon: const Icon(Icons.person, size: 80),
    //           label: 'Usuários',
    //         ),
    //         _componenteFoda(
    //           icon: const Icon(Icons.person, size: 80),
    //           label: 'Aulas',
    //         ),
    //         _componenteFoda(
    //           icon: const Icon(Icons.person, size: 80),
    //           label: 'Cadastrar',
    //         ),
    //         _componenteFoda(
    //           icon: const Icon(Icons.person, size: 80),
    //           label: 'Cadastrar',
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
