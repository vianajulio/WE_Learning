import 'package:flutter/material.dart';
import 'package:we_learning_dev/ui/color/colors.dart';
import 'package:we_learning_dev/ui/widgets/custom_text.dart';

class ItemForum extends StatelessWidget {
  const ItemForum({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: tertiaryBlue,
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.only(
              top: 24,
              right: 24.0,
              bottom: 8.0,
              left: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: primaryBlue,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Titulo',
                          color: primaryWhite,
                        ),
                        CustomText(
                          text: 'Autor',
                          color: secondaryWhite,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  child: CustomText(
                    text: 'Quantidade de Resposta',
                    color: tertiaryWhite,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8)),
              color: secondaryBlue,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
