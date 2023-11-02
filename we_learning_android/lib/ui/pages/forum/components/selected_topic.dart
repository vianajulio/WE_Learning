import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../entities/topico.dart';
import '../../../../controllers/pages_controllers/forumPageController.dart';
import '../../topico/topico_page.dart';
import '../../topico/components/topic_widget.dart';

class SelectedTopics extends StatelessWidget {
  const SelectedTopics({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GetBuilder(
        //incialização do contotroler para utilizar o método getAll
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
                    return TopicoPage(
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
