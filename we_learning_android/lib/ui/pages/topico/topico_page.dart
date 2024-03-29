import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_widgets/scaffold_custom.dart';

import '../../../controllers/entities_controllers/respostas_model.dart';
import '../../../entities/resposta.dart';
import '../../../entities/topico.dart';
import '../../colors/colors.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/message.dart';
import 'components/resposta_widget.dart';
import 'components/respostas_widget.dart';

class TopicoPage extends StatelessWidget {
  final Topico topico;

  const TopicoPage({super.key, required this.topico});

  @override
  Widget build(BuildContext context) {
    RespostaModel controller = Get.put(RespostaModel());

    return ScaffoldCustom(
      titleAppBar: CustomText(
        text: topico.tituloTopico!,
        color: primaryWhite,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        maxLines: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RespostaWidget(topico: topico),
            ),
          ).then((value) {
            controller.getAll(topico.id!);
          });
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: "Autor: ${topico.nomeUsuario!}",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(width: 24),
                  CustomText(
                    text: "Categoria: ${topico.nomeCategoria!}",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              CustomText(
                text: "Data: ${Topico.dataFormat(topico.dataTopico)}",
                fontSize: 12,
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 243, 243, 243),
                ),
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Text(
                  topico.descricaoTopico!,
                ),
              ),

              const Divider(thickness: 1.2, color: Colors.black26, height: 30),

              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    if (!controller.loadResposta.value) {
                      controller.getAll(topico.id!);
                    }
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ),
              //Respostas do tópico
              GetBuilder(
                init: RespostaModel(),
                initState: (state) {
                  controller.getAll(topico.id!);
                },
                builder: (controllerBuilder) {
                  return FutureBuilder(
                    future: controller.futureRespostas,
                    builder:
                        (context, AsyncSnapshot<List<Resposta>?> snapshot) {
                      if (snapshot.hasData) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 480),
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
                                  physics: const NeverScrollableScrollPhysics(),
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
                      } else if (snapshot.hasError) {
                        return Message.alert(
                          'Não foi possível obter os dados do servidor',
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
