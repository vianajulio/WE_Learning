import 'package:flutter/material.dart';
<<<<<<< HEAD:we_learning/lib/ui/widgets/custom_text.dart
=======
import 'package:we_learning_dev/ui/color/colors.dart';
>>>>>>> julio:lib/ui/widgets/custom_text.dart

class CustomText extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  int maxLines;
<<<<<<< HEAD:we_learning/lib/ui/widgets/custom_text.dart
  CustomText({
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16,
    this.maxLines = 1,
    this.fontWeight = FontWeight.normal,
=======
  TextAlign? textAlign;
  CustomText({
    super.key,
    required this.text,
    this.color = primaryBlack,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 1,
    this.textAlign,
>>>>>>> julio:lib/ui/widgets/custom_text.dart
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
<<<<<<< HEAD:we_learning/lib/ui/widgets/custom_text.dart
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: maxLines,
=======
      ),
      softWrap: true,
      maxLines: maxLines,
      textAlign: textAlign,
>>>>>>> julio:lib/ui/widgets/custom_text.dart
    );
  }
}
