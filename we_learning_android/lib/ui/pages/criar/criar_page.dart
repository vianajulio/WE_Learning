import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class CriarPage extends StatelessWidget {
  const CriarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CustomText(text: 'Criar'),),
    );
  }
}