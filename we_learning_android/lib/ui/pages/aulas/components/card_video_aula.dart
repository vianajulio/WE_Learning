import 'package:flutter/material.dart';
import '../../video_aula/videoaula_page.dart';

import '../../../custom_widgets/custom_text.dart';

class CardAula extends StatelessWidget {
  final String title;
  final IconData icon;

  const CardAula({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VideoAulaPage(),
            ));
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 52),
              const SizedBox(height: 16),
              CustomText(text: title, textAlign: TextAlign.center, maxLines: 2),
            ],
          ),
        ),
      ),
    );
  }
}
