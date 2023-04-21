import 'package:flutter/material.dart';
import 'package:we_learning_dev/ui/color/colors.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  int maxLines;
  TextAlign? textAlign;
  CustomText({
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
    );
  }
}
