import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/resposta.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/custom_text_form_field.dart';

class RespostaWidget extends StatelessWidget {
  Resposta resposta;
  RespostaWidget({super.key, required this.resposta});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: resposta.usuario ?? ""),
            CustomText(text: resposta.data ?? ""),
            const Divider(thickness: 22, height: 40),
            CustomText(text: resposta.assuntoResposta ?? ""),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            InkWell(
              child: const Icon(
                Icons.keyboard_arrow_up,
                color: primaryRed,
                size: 40,
              ),
              onTap: () {
                print("LIKE");
              },
            ),
            const CustomText(
              text: 'Qtd Like',
              fontSize: 12,
            ),
          ],
        ),
      ],
    );
  }
}
