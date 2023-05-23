import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/resposta.dart';

class RespostaWidget extends StatelessWidget {
  Resposta resposta;
  RespostaWidget({super.key, required this.resposta});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(resposta.assunto_topico ?? ""),
    );
  }
}
