import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/model/pages/forumpage_controller.dart';
import 'package:we_learning_android/ui/pages/forum/topicowidget.dart';

class SelectedTopicos extends StatelessWidget {
  final ForumController controller = Get.find();
  SelectedTopicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: controller.selectedTopicos?.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.selectedTopicos!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: TopicoWidget(
                      topicoApp: controller.selectedTopicos![index],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
