import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/model/pages/forumpage_controller.dart';
import 'package:we_learning_android/ui/pages/forum/widgets/custom_radio_btn.dart';

class FiltroMateria extends StatelessWidget {
  final controller = Get.put(ForumController());

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Obx(
      () => ListView.builder(
        itemCount: controller.filter.length,
        itemBuilder: (context, index) {
          return Container(
            height: 70,
            child: CustomRadioBtn(
              text: controller.filter[index],
            ),
          );
        },
      ),
    ));
  }
}
