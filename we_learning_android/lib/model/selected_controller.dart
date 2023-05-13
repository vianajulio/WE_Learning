import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/model/forum_controller.dart';
import 'package:we_learning_android/ui/pages/forum/topico.dart';

class SelectedTopicos extends StatelessWidget {
  final ForumController controller = Get.find();
  SelectedTopicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
        () {
          if (controller.selectedTopicos.isEmpty ) {
            return ListView.builder(
              itemCount: controller.selectedTopicos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: TopicoWidget(
                    topico: controller.selectedTopicos[index],
                  ),
                );
              },
            );
          } else {
            return ListView.builder(
              itemCount: controller.selectedTopicos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: TopicoWidget(
                    topico: controller.selectedTopicos[index],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
