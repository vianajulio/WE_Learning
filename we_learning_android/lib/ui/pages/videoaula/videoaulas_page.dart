import 'package:flutter/material.dart';

import '../../widgets/page/videoAula/cardVideoAula.dart';

class VideoaulasPage extends StatelessWidget {
  const VideoaulasPage({super.key});

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
            return CardAula(
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
