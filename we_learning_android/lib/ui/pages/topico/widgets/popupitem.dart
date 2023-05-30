import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class CustomPopUpItem extends StatelessWidget {
  String text;
  double? width;
  double? height;
  Color? color;

  CustomPopUpItem({super.key, required this.text, this.width = 100, this.height = 100, this.color = primaryWhite});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: PopupMenuItem(
        child: Text(text),
      ),
    );
  }
}
