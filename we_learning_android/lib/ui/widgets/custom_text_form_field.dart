import 'package:flutter/material.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController? textController;
  String? hintText;
  FormFieldValidator<String>? validator;
  int? maxLines;
  int? maxLength;
  bool? counter;

  CustomTextFormField({
    super.key,
    this.textController,
    this.hintText = '',
    this.validator,
    this.maxLines = 1,
    this.maxLength = 50,
    this.counter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: textController,
          validator: validator,
          maxLines: maxLines,
          minLines: 1,
          maxLength: maxLength,
          decoration: InputDecoration(
            fillColor: primaryWhite,
            filled: true,
            hintText: hintText,
            
            border: const OutlineInputBorder(
              borderSide: BorderSide(strokeAlign: 2),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            // counter: counter == false ? Container() : Text('Oi'),
            counterStyle: TextStyle(fontSize: counter == false ? 0 : 12 )
          ),
        ),
      ],
    );
  }
}
