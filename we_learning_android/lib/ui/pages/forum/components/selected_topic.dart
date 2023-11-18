import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/entities_controllers/topic_model.dart';
import '../../../custom_widgets/message.dart';
import '../../topico/topico_page.dart';
import 'forum_widget.dart';

class SelectedTopics extends StatelessWidget {
  const SelectedTopics({super.key});

  @override
  Widget build(BuildContext context) {
    TopicModel controller = Get.put(TopicModel());
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              controller.get();
            },
            child: Text('Clica')),
        GetBuilder<TopicModel>(
          builder: (controllerBuilder) {
            return FutureBuilder(
              future: controllerBuilder.futureTopics,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: ForumWidget(
                          topico: snapshot.data![index],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return TopicoPage(topico: snapshot.data![index]);
                            }),
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Message.alert('Erro na solicitação dos dados');
                }
                return const CircularProgressIndicator();
              },
            );
          },
        ),
      ],
    );
  }
}
