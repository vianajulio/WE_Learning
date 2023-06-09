import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/category_model.dart';
import 'package:we_learning_android/controllers/entities_controllers/topic_model.dart';
import 'package:we_learning_android/controllers/pages_controllers/forum_page_controller.dart';
import 'package:we_learning_android/entities/category.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/repository/local/category_local.dart';
import 'package:we_learning_android/ui/pages/forum/widgets/criar_topico.dart';
import 'package:we_learning_android/ui/pages/forum/widgets/selected_topic.dart';
import 'package:we_learning_android/ui/pages/forum/widgets/filtro_materia.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/message.dart';
import 'package:we_learning_android/ui/widgets/search_bar.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    var listFiltros = CategoryLocal.instance.getCategory();
    double width = 340.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum'),
        centerTitle: true,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const CustomText(
                    text: 'Filtros.',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 8),
                const CustomText(text: 'Clique para filtrar os tópicos.'),
                const SizedBox(height: 16),
                GetBuilder(
                  init: CategoryModel(),
                  builder: (controller) => listFiltros == null
                      ? FutureBuilder(
                          future: controller.futureCategories,
                          builder: (context,
                              AsyncSnapshot<List<Category>?> snapshot) {
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
                                  return const FiltroMateria();
                                }
                            }
                          },
                        )
                      : const FiltroMateria(),
                ),
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
                          child: SearchBar(
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
