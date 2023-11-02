import 'package:flutter/material.dart';

import 'components/card_video_aula.dart';

class AulasPage extends StatelessWidget {
  const AulasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: GridView.builder(
          itemCount: 12,
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (BuildContext context, int index) {
            return const CardAula(
              colorIcon: Colors.purple,
              titulo: 'Front-End',
              descricao: 'Criação e estilização web.',
            );
          },
        ),
      ),
    );
  }
}
