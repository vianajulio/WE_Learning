import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class CriarPage extends StatelessWidget {
  const CriarPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    var icon = Icon(Icons.abc);
    return Container(
      //child: const Center(child: CustomText(text: 'Criar'),),
      child: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _componenteFoda(
              icon: const Icon(Icons.person, size: 80),
              label: 'Usuários',
            ),
            _componenteFoda(
              icon: const Icon(Icons.person, size: 80),
              label: 'Aulas',
            ),
            _componenteFoda(
              icon: const Icon(Icons.person, size: 80),
              label: 'Cadastrar',
            ),
            _componenteFoda(
              icon: const Icon(Icons.person, size: 80),
              label: 'Cadastrar',
            ),
          ],
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
