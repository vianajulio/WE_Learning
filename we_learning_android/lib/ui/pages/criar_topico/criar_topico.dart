import 'package:flutter/material.dart';
import 'package:we_learning_android/controllers/entities_controllers/topic_model.dart';
import 'package:we_learning_android/ui/colors/colors.dart';
import 'package:we_learning_android/ui/pages/criar_topico/widgets/dropdownbtn.dart';
import 'package:we_learning_android/ui/widgets/custom_text.dart';
import 'package:we_learning_android/ui/widgets/custom_text_form_field.dart';
import 'package:we_learning_android/ui/widgets/message.dart';

class CadastrarTopico extends StatelessWidget {
  CadastrarTopico({super.key});

  var _tituloController = TextEditingController();
  var _descricaoController = TextEditingController();
  //  var _tituloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Titulo:',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const CustomText(
                text: 'Coloque um título que correspoda a sua dúvida.',
              ),
              CustomTexteFormField(
                counter: true,
                maxLength: 40,
                textController: _tituloController,
              ),
              const SizedBox(height: 24),
              const CustomText(
                text: 'Descrição:',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const CustomText(
                text:
                    'Descreva sua dúvida de forma que o leitor consiga enteder o seu caso.',
                maxLines: 2,
              ),
              const SizedBox(height: 14),
              CustomTexteFormField(
                textController: _descricaoController,
                maxLines: 16,
                maxLength: 840,
                counter: true,
              ),

              //DropDown
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child: const DropDownBTN(),
              ),

              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 44,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      cadastrarTopic(context);
                    },
                    child: const CustomText(
                      text: 'Cadastrar',
                      color: primaryWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void cadastrarTopic(BuildContext context) {
    FocusScope.of(context).unfocus();
    
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    TopicModel().post(
      _tituloController.text,
      _descricaoController.text,
      onSucess: () => Message.onSucess(
        context: context,
        message: 'Topico cadastrado com sucesso.',
        onPop: (_) {
          Navigator.of(context).pop();
        },
      ),
      onFail: () => Message.onFail(
        context: context,
        message: "Falha ao cadastrar.",
      ),
    );
  }
}
