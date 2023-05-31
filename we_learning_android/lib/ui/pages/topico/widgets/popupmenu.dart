import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_learning_android/controllers/pages_controllers/topico_controller.dart';
import 'package:we_learning_android/entities/topico.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/pages/topico/widgets/editar_topico_page.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';

class CustomPopUpMenu extends StatelessWidget {
  Topico topico;
  CustomPopUpMenu({super.key, required this.topico});

  List<String> denuncias = [
    "Spam",
    "Símbolos ou discurso de ódio",
    "Outra coisa"
  ];
  List<String> titulos = ["Editar Tópico", "Apa ga Tópico", "Denuncia"];
  List<String> content = ["Editar Tópico", "Apagar", "Denunciar"];
  String? dropValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: primaryWhite,
      onSelected: (int value) {
        if (value == 0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  EditarTopico(topico: topico,),
            ),
          );
        } else {
          showDialog(
            context: context,
            // Ao clicar fora do AlertDialog não fecha automaticamente
            barrierDismissible: false,
            builder: (context) => ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 180),
              child: AlertDialog(
                title: Text(titulos[value]),
    
                actions: [
                  // BTN cancelar
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const CustomText(
                      text: "Cancelar",
                      color: primaryBlack,
                    ),
                  ),
    
                  // BTN para confirmar a função
                  TextButton(
                    onPressed: () {
                      //TODO tela de agredecimento da denuncia
                    },
                    child: CustomText(
                      text: content[value],
                      color: primaryRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
    
                //Conteúdo do AlertDialog
                content: GetBuilder(
                  init: TopicoModel(),
                  builder: (controller) {
                    return lista(value, controller);
                  },
                ),
              ),
            ),
          );
        }
        
      },
      itemBuilder: (_) {
        return const [
          PopupMenuItem(
            value: 0,
            child: Text('Editar'),
          ),
          PopupMenuItem(
            value: 1,
            child: Text('Apagar'),
          ),
          PopupMenuItem(
            value: 2,
            child: Text('Denunciar'),
          ),
        ];
      },
    );
  }

  // método para preencher o content do AlertDialog
  Widget lista(int value, var controller) {
    switch (value) {
      case 1:
        return const Text("Deseja realmente apagar o tópico?");
      case 2:
        return SizedBox(
          height: 80,
          child: Column(
            children: [
              const Text("Selecione o motivo da denúncia:"),
              DropdownButton(
                value: controller.dropValue.value,
                items: denuncias.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.updateDropValue(value);
                },
              )
            ],
          ),
        );

      default:
        return const CustomText(text: "Selecione novamente");
    }
  }
}
