import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/ui/custom_widgets/scaffold_custom.dart';
import 'package:we_learning_android/ui/pages/forum/components/filtro_materia.dart';
import '../../../controllers/entities_controllers/topic_model.dart';
import '../../../controllers/pages_controllers/forum_page_controller.dart';
import '../../../entities/topico.dart';
import '../topico/criar_topico_page/criar_topico_page.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/message.dart';
import '../../custom_widgets/search_bar.dart';
import 'components/selected_topic.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 340.0;
    return ScaffoldCustom(
      drawer: const SafeArea(
        child: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                CustomText(
                  text: 'Filtros.',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 8),
                CustomText(text: 'Clique para filtrar os tópicos.'),
                SizedBox(height: 24),
                FiltroMateria()
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => await ForumController().updateValues(),
        child: GetBuilder(
          init: TopicModel(),
          builder: (controller) => FutureBuilder(
            future: controller.futureTopics,
            builder: (context, AsyncSnapshot<List<Topico>?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Message.alert(
                    'Não foi possivel obter os dados necessários',
                  );
                case ConnectionState.waiting:
                  return Message.loading(context);
                default:
                  if (snapshot.hasError) {
                    return Message.alert(
                      'Não foi possível obter os dados do servidor',
                    );
                  } else if (!snapshot.hasData) {
                    return Message.alert(
                      'Não foi possível obter os dados dos topicos',
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return Message.alert(
                      'Nenhum topico encontrado',
                    );
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: CustomSearchBar(
                            hintText: 'Qual é a sua dúvida?',
                            largura: width,
                          ),
                        ),
                        const SelectedTopics(),
                      ],
                    );
                  }
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CadastrarTopico(),
            ),
          );
        },
      ),
    );
  }
}
