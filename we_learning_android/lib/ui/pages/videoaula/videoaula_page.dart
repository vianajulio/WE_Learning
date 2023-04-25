import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class VideoaulaPage extends StatelessWidget {
  const VideoaulaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CustomText(text: 'Videoaula'),),
    );
  }
}