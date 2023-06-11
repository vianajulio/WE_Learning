import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/resposta.dart';
import 'package:we_learning_android/entities/topico.dart';

class RespostasWidget extends StatelessWidget {
  final Resposta resposta;
  const RespostasWidget({super.key, required this.resposta});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(resposta.usuario ?? ""),
          Text(Topico.dataFormat(resposta.data)),
          const SizedBox(height: 16),
          Text(resposta.conteudoResposta ?? ""),
        ],
      ),
    );
  }
}
