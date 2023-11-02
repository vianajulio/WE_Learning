import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/pages_controllers/loginPageController.dart';
import 'package:we_learning_android/ui/colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textController;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int? maxLength;
  final bool? counter;

  const CustomTextFormField({
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
              border: const UnderlineInputBorder(
                borderSide: BorderSide(strokeAlign: 2),
              ),
              counterStyle: TextStyle(fontSize: counter == false ? 0 : 12)),
        ),
      ],
    );
  }
}

class CustomTextFormFieldObscure extends StatelessWidget {
  final TextEditingController? textController;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int? maxLength;
  final bool? counter;

  const CustomTextFormFieldObscure({
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
    return GetBuilder(
      init: LoginPageController(),
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: textController,
            validator: validator,
            maxLines: maxLines,
            minLines: 1,
            maxLength: maxLength,
            obscureText: controller.eye,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                      controller.eye ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => controller.eyeOnClick(),
                ),
                hintText: hintText,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(strokeAlign: 2),
                ),
                counterStyle: TextStyle(fontSize: counter == false ? 0 : 12)),
          ),
        ],
      ),
    );
  }
}
