import 'package:flutter/material.dart';

import '../../../../entities/topico.dart';
import '../../../colors/colors.dart';
import '../../../custom_widgets/custom_text.dart';
import 'popupmenu.dart';

class ForumWidget extends StatelessWidget {
  final Topico topico;

  const ForumWidget({super.key, required this.topico});

  final double width = 340;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, top: 16),
            width: width,
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
                          width: 220,
                          child: CustomText(
                            text: topico.tituloTopico ?? '',
                            color: primaryWhite,
                            maxLines: 1,
                          ),
                        ),
                        CustomText(
                          text: topico.nomeUsuario ?? '',
                          color: secondaryWhite,
                        ),
                      ],
                    ),
                    CustomPopUpMenu(
                      topico: topico,
                    )
                  ],
                ),
                const CustomText(
                  //TODO Fazer método para pegar as respostas
                  text: 'Quantidade de respostas',
                  color: secondaryWhite,
                )
              ],
            ),
          ),
          Container(
            width: width,
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
