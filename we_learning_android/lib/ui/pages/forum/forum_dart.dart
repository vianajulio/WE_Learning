import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/pages/forum/materia.dart';
import 'package:we_learning_android/ui/pages/forum/topico.dart';
import 'package:we_learning_android/ui/widgets/search_bar.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 300.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Aulas'),
        centerTitle: true,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Materia(
                textCheckBox: const [
                  'LMA',
                  'SOP',
                  'FPOO',
                  'HARE',
                ],
              ),
            ],
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 26,
                itemExtent: 200.0,
                itemBuilder: (context, index) {
                  return Topico(
                    width: width,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
