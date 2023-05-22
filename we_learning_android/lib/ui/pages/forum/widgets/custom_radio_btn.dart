import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/model/pages/forumpage_controller.dart';

class CustomRadioBtn extends StatelessWidget {
  String text;

  CustomRadioBtn({required this.text});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ForumController(),
      builder: (controller) => Container(
        height: 60,
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: InkWell(
          child: Row(
            children: [
              Text(text),
              const Spacer(),
              Radio(
                value: text,
                groupValue: controller.option,
                onChanged: (value) {
                  controller.opcoes(text);
                  controller.filterBag(text);
                },
              ),
            ],
          ),
          onTap: () {
            controller.opcoes(text);
            controller.filterBag(text);
          },
        ),
      ),
    );
  }
}
