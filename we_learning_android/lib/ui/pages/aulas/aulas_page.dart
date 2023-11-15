import 'package:flutter/material.dart';

import '../../custom_widgets/scaffold_custom.dart';
import 'components/card_video_aula.dart';

class AulasPage extends StatelessWidget {
  const AulasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      drawer: const SafeArea(child: Drawer()),
      body: Center(
        child: ListView.builder(
          itemCount: 8,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          itemBuilder: (context, index) {
            return const CardAula(
              titulo: 'Front-End',
              descricao: 'Criação e estilização web.',
            );
          },
        ),
      ),
    );
  }
}
