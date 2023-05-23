import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextAlign? textAlign;
  
  const CustomText({
    super.key,
    required this.text,
    this.color = primaryBlack,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 1,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      softWrap: true,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
