import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/custom_widgets/global_components/scaffold_custom.dart';

import 'criar_aula.dart';
import 'criar_user.dart';

class CriarPage extends StatelessWidget {
  const CriarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
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
