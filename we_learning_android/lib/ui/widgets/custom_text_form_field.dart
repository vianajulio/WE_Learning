import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class CustomTexteFormField extends StatelessWidget {
  TextEditingController? textController;
  String? hintText;
  FormFieldValidator<String>? validator;
  CustomTexteFormField({
    super.key,
    this.textController,
    this.hintText = '',
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: textController,
          validator: validator,
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
