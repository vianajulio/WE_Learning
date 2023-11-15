import 'package:flutter/material.dart';

import '../../../custom_widgets/custom_text.dart';

class CardAula extends StatelessWidget {
  final String titulo;
  final String descricao;

  const CardAula({
    super.key,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: titulo,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                CustomText(
                  text: descricao,
                  fontSize: 12,
                  maxLines: 2,
                ),
              ],
            ),
            const Spacer(),
            Container(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 48,
                height: 48,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
