import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/topico.dart';

class TopicPage extends StatelessWidget {
  Topico topico;
  TopicPage({super.key, required this.topico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topico.assuntoTopico!),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(topico.assuntoTopico!),
            Container(
              color: Colors.blueAccent,
              height: 200,
              width: double.infinity,
              child: Text(topico.nomeUsuario!),
            ),
          ],
        ),
      ),
    );
  }
}
