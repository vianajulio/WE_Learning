import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/controllers/pages_controllers/forumpage_controller.dart';
import 'package:we_learning_android/ui/pages/forum/topico_page.dart';
import 'package:we_learning_android/ui/pages/forum/widgets/topic_widget.dart';

class SelectedTopics extends StatelessWidget {
  const SelectedTopics({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GetBuilder(
        init: ForumController(),
        builder: (controller) => ListView.builder(
          itemCount: controller.selectedTopicos?.length ?? 0,
          itemBuilder: (context, index) {
            return InkWell(
              child: ForumWidget(
                topico: controller.selectedTopicos?[index] ?? Topico(),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TopicPage(
                        topico: controller.selectedTopicos![index]);
                  }),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
