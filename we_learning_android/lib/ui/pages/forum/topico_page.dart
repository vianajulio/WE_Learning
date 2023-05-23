import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/respostas_model.dart';
import 'package:we_learning_android/entities/resposta.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/repository/api/resposta_api.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/pages/forum/resposta_widget.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/message.dart';

class TopicPage extends StatefulWidget {
  Topico topico;
  TopicPage({super.key, required this.topico});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  late Future<List<Resposta>?> respostas;
  @override
  void initState() {
    respostas = RespostaApi.instance.getAll(widget.topico.id ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Titulo: ${widget.topico.tituloTopico!}",
          color: primaryWhite,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          maxLines: 1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: "Autor: ${widget.topico.nomeUsuario!}",
                  fontSize: 14,
                ),
                const SizedBox(height: 8),
                CustomText(
                  text: "Categoria: ${widget.topico.nomeCategoria!}",
                  fontSize: 14,
                ),
              ],
            ),
            CustomText(
                text: "Data: ${widget.topico.dataTopico!}", fontSize: 12),
            const Divider(thickness: 1.2, color: Colors.black26, height: 30),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 243, 243, 243),
                ),
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Text(
                  "${widget.topico.assuntoTopico!}  ",
                ),
              ),
            ),

            const Divider(thickness: 1.2, color: Colors.black26, height: 30),

            //Respostas do tópico
            GetBuilder(
              init: RespostaModel(),
              builder: (controller) {
                return FutureBuilder(
                    future: respostas,
                    builder:
                        (context, AsyncSnapshot<List<Resposta>?> snapshot) {
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
                            return Flexible(
                              child: ListView.builder(
                                itemCount: snapshot.data?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return RespostaWidget(
                                    resposta:
                                        snapshot.data?[index] ?? Resposta(),
                                  );
                                },
                              ),
                            );
                          }
                      }
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
