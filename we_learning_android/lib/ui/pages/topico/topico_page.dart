import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/entities_controllers/respostas_model.dart';
import 'package:we_learning_android/entities/resposta.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/repository/api/resposta_api.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/pages/topico/widgets/resposta_widget.dart';
import 'package:we_learning_android/ui/pages/topico/widgets/respostas_widget.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/custom_text_form_field.dart';
import 'package:we_learning_android/ui/widgets/message.dart';

class TopicoPage extends StatefulWidget {
  Topico topico;
  TopicoPage({super.key, required this.topico});

  @override
  State<TopicoPage> createState() => _TopicoPageState();
}

class _TopicoPageState extends State<TopicoPage> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog.fullscreen(
                child: RespostaWidget(topico: widget.topico),
              );
            },
          );
        },
        child: const Icon(Icons.add),
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
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(width: 24),
                CustomText(
                  text: "Categoria: ${widget.topico.nomeCategoria!}",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            CustomText(
              text: "Data: ${Topico.dataFormat(widget.topico.dataTopico)}",
              fontSize: 12,
            ),
            const SizedBox(height: 16),
            Flexible(
              fit: FlexFit.loose,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 243, 243, 243),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: Text(
                    widget.topico.descricaoTopico!,
                  ),
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
                  builder: (context, AsyncSnapshot<List<Resposta>?> snapshot) {
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
                            'Não foi possível obter os dados das resposta',
                          );
                        } else if (snapshot.data!.isEmpty) {
                          return Message.alert(
                            'Nenhuma resposta encontrada',
                          );
                        } else {
                          return Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 24),
                                  child: CustomText(
                                    text:
                                        "Quantidade de respostas: ${snapshot.data?.length}",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                            thickness: 1,
                                            height: 40,
                                            color: Colors.black26),
                                    itemCount: snapshot.data?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return RespostasWidget(
                                        resposta:
                                            snapshot.data?[index] ?? Resposta(),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
