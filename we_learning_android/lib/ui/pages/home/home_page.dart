import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/widgets/global_widgets/carousel.dart';
import 'package:we_learning_android/ui/widgets/global_widgets/search_bar.dart';

import '../../widgets/page/home/materia_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomSearchBar(
                  hintText: 'Qual matéria deseja estudar?', largura: 320),
              const SizedBox(height: 32),
              CustomCarosel(
                sideArrow: false,
                autoPlay: true,
                listItens: const [
                  MateriaItem(
                    titulo: 'POO',
                    subtitulo: 'Programação Orientada a Objetos',
                    color: Colors.black54,
                  ),
                  MateriaItem(
                    titulo: 'LMA',
                    subtitulo: 'Linguagem de Marcação',
                    color: Colors.blueGrey,
                  ),
                  MateriaItem(
                    titulo: 'Hare',
                    subtitulo: 'Hardware e Redes',
                    color: Colors.indigo,
                  ),
                  MateriaItem(
                    titulo: 'SOP',
                    subtitulo: 'Sistemas Operacionais',
                    color: Colors.deepPurple,
                  ),
                  MateriaItem(
                    titulo: 'PWE',
                    subtitulo: 'Programação Web Back-End',
                    color: Colors.deepOrangeAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
