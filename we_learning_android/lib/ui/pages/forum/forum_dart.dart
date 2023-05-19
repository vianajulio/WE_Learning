import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CustomText(text: 'Forum'),
      ),
    );
  }
}
