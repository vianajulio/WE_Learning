import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class ForumWidget extends StatelessWidget {
  late final Topico topico;
  ForumWidget({required this.topico});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, top: 16),
            width: 300,
            height: 100,
            color: tertiaryBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: CustomText(
                            text: topico.tituloTopico ?? '',
                            color: primaryWhite,
                            maxLines: 1,
                            
                          ),
                        ),
                        CustomText(
                          text: topico.nomeUsuario ?? '',
                          color: secondaryWhite,
                        )
                      ],
                    ),
                  ],
                ),
                const CustomText(
                  text: 'Quantidade de respostas',
                  color: secondaryWhite,
                )
              ],
            ),
          ),
          Container(
            width: 300,
            height: 60,
            color: secondaryBlue,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: const CustomText(
              text: 'Resposta mais votada',
              color: primaryWhite,
            ),
          ),
        ],
      ),
    );
  }
}
