import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/pages_controllers/forum_page_controller.dart';
import 'package:we_learning_android/entities/category.dart';

class CustomRadioBtn extends StatelessWidget {
  final Category category;

  const CustomRadioBtn({super.key, required this.category});

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
              Text(category.name ?? ''),
              const Spacer(),
              Radio(
                value: category.name,
                groupValue: controller.option,
                onChanged: (value) {
                  controller.opcoes(category.name ?? 'Todos');
                  controller.filterBag(category.name ?? 'Todos');
                },
              ),
            ],
          ),
          onTap: () {
            controller.opcoes(category.name ?? 'Todos');
            controller.filterBag(category.name ?? 'Todos');
          },
        ),
      ),
    );
  }
}
