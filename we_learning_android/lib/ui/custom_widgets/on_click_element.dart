import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class Onclickelement extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final VoidCallback function;
  final Widget innerWidget;
  const Onclickelement({
    super.key,
    required this.width,
    required this.height,
    required this.function,
    required this.innerWidget,
    this.color = primaryWhite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: function,
          child: Center(
            child: innerWidget,
          ),
        ),
      ),
    );
  }
}
