import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/resposta.dart';

class RespostaWidget extends StatelessWidget {
  Resposta resposta;
  RespostaWidget({super.key, required this.resposta});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(resposta.usuario ?? ""),
          Text(resposta.data ?? ""),
          const SizedBox(height: 16),
          Text(resposta.conteudoResposta ?? ""),
        ],
      ),
    );
  }
}
