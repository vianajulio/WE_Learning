import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_widgets/scaffold_custom.dart';
import 'components/filtro_materia.dart';
import '../../../controllers/entities_controllers/topic_model.dart';
import 'components/forum_widget.dart';
import 'criar_topico_page/criar_topico_page.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/message.dart';
import '../../custom_widgets/search_bar.dart';
import '../topico/topico_page.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 340.0;
    TopicModel controller = Get.put(TopicModel());

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
      //TODO: RELACIONAR FILTRO COM TOPICOS
      body: RefreshIndicator(
        onRefresh: () => controller.get(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: CustomSearchBar(
                  hintText: 'Qual é a sua dúvida?',
                  largura: width,
                ),
              ),
              // const SelectedTopics(),
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
                                    return TopicoPage(
                                        topico: snapshot.data![index]);
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
              )
            ],
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
