import 'package:flutter/material.dart';
import 'package:we_learning_android/model/selected_controller.dart';
import 'package:we_learning_android/ui/pages/forum/materia.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/search_bar.dart';

class ForumPage extends StatelessWidget {
  ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 340.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum'),
        centerTitle: true,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                CustomText(text: 'Filtros.', fontSize: 24,fontWeight: FontWeight.bold),
                const SizedBox(height: 8),
                CustomText(text: 'Clique para filtrar os tópicos.'),
                const SizedBox(height: 16),
                Materia(),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: SearchBar(
                hintText: 'Qual é a sua dúvida?',
                largura: width,
              ),
            ),
            //TODO inserir filtro e lista de topicos
            SelectedTopicos(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

