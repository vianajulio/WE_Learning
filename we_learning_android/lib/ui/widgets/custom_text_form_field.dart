import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class CustomTexteFormField extends StatelessWidget {
  TextEditingController? textController;
  String? hintText;
  CustomTexteFormField({super.key, this.textController, this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: textController,
          decoration: InputDecoration(
            fillColor: primaryWhite,
            filled: true,
            hintText: hintText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(strokeAlign: 2),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
