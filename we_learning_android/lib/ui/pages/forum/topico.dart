import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class Topico extends StatelessWidget {
  int index;
  double width;
  Topico({required this.width, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
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
                      children: [
                        CustomText(
                          text: 'Titulo',
                          color: primaryWhite,
                        ),
                        CustomText(
                          text: 'Autor $index',
                          color: secondaryWhite,
                        )
                      ],
                    ),
                  ],
                ),
                CustomText(
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
            child: CustomText(
              text: 'Resposta mais votada',
              color: primaryWhite,
            ),
          ),
        ],
      ),
    );
  }
}
