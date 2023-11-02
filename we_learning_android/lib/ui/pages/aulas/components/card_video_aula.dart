
import 'package:flutter/material.dart';

import '../../../custom_widgets/global_components/custom_text.dart';

class CardAula extends StatelessWidget {
  final Color colorIcon;
  final String titulo;
  final String descricao;

   const CardAula({
    super.key,
    required this.colorIcon,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: Colors.black, width: 1.0, style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Icon(Icons.edit_square, color: colorIcon),
          ),
          CustomText(
            text: titulo,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          CustomText(
            text: descricao,
            fontSize: 12,
            maxLines: 2,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
