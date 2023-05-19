import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/entities/topicoapp.dart';
import 'package:we_learning_android/model/pages/forumpage_controller.dart';
import 'package:we_learning_android/ui/pages/forum/widgets/topicowidget.dart';

class SelectedTopics extends StatelessWidget {
  SelectedTopics({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GetBuilder(
        init: ForumController(),
        builder: (controller) => controller.selectedTopicos!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.selectedTopicos?.length ?? 0,
                itemBuilder: (context, index) {
                  return TopicoWidget(
                    topicoApp:
                        controller.selectedTopicos?[index] ?? TopicoApp(),
                  );
                },
              ),
      ),
    );
  }
}
