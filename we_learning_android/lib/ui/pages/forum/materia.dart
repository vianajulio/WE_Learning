import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/model/forum_controller.dart';
import 'package:we_learning_android/ui/pages/forum/custom_elevated_btn_forum.dart';

class Materia extends StatelessWidget {
  final controller = Get.put(ForumController());

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Obx(
      () => ListView.builder(
        itemCount: controller.filter.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomElevatedBtnForum(
              filtro: controller.filter[index],
              function: () => controller.filterBag(controller.filter[index].tipo),
            ),
          );
        },
      ),
    ));
  }
}
