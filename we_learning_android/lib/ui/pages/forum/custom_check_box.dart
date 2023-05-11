import 'package:flutter/material.dart';

class CustomTextCheckBox extends StatefulWidget {
  String text;
  CustomTextCheckBox({super.key, required this.text});

  @override
  State<CustomTextCheckBox> createState() => _CustomTextCheckBoxState();
}

class _CustomTextCheckBoxState extends State<CustomTextCheckBox> {
  bool? valueCB = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(widget.text),
          const Spacer(),
          Checkbox(
            value: valueCB,
            onChanged: (value) {
              setState(() {
                valueCB = value;
              });
            },
          )
        ],
      ),
    );
  }
}